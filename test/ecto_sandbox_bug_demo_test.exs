defmodule EctoSandboxBugDemoTest do
  use ExUnit.Case

  test "without transaction" do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoSandboxBugDemo.Repo)

    Ecto.Adapters.SQL.Sandbox.mode(EctoSandboxBugDemo.Repo, {:shared, self()})

    assert {:ok, _todo} = EctoSandboxBugDemo.TodoWorker.create_todo()
  end

  test "without genserver call" do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoSandboxBugDemo.Repo)

    Ecto.Adapters.SQL.Sandbox.mode(EctoSandboxBugDemo.Repo, {:shared, self()})

    assert {:ok, _todo} = EctoSandboxBugDemo.Repo.transaction(fn ->
      %EctoSandboxBugDemo.Todo{title: "ok"}
    |> EctoSandboxBugDemo.Repo.insert
    end)
  end


  test "shared mode" do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoSandboxBugDemo.Repo)

    Ecto.Adapters.SQL.Sandbox.mode(EctoSandboxBugDemo.Repo, {:shared, self()})

    assert {:ok, _todo} = EctoSandboxBugDemo.Repo.transaction(fn ->
      EctoSandboxBugDemo.TodoWorker.create_todo()
    end)
  end

  test "manual mode" do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoSandboxBugDemo.Repo)

    Ecto.Adapters.SQL.Sandbox.allow(EctoSandboxBugDemo.Repo, self(), GenServer.whereis(EctoSandboxBugDemo.TodoWorker))

    assert {:ok, _todo} = EctoSandboxBugDemo.Repo.transaction(fn ->
      EctoSandboxBugDemo.TodoWorker.create_todo()
    end)
  end

end
