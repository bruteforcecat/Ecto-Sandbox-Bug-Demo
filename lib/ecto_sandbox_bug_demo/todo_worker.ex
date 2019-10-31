defmodule EctoSandboxBugDemo.TodoWorker do

  use GenServer
  # client
  def start_link(_opts) do
    GenServer.start_link(
      __MODULE__,
      %{},
      name: __MODULE__
    )
  end

  # server
  @impl true
  def init(_args) do
    {:ok, %{}}
  end

  def create_todo() do
    GenServer.call(__MODULE__, :create_todo, :infinity)
  end

  @impl true
  def handle_call(:create_todo, _from, state) do
    result = %EctoSandboxBugDemo.Todo{title: "ok"}
    |> EctoSandboxBugDemo.Repo.insert

    {:reply, result, state}
  end

end
