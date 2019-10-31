defmodule EctoSandboxBugDemo.Repo do
  use Ecto.Repo,
    otp_app: :ecto_sandbox_bug_demo,
    adapter: Ecto.Adapters.Postgres
end
