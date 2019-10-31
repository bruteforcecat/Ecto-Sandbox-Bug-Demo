import Config

# Configure your database
config :ecto_sandbox_bug_demo, EctoSandboxBugDemo.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ecto_sandbox_bug_demo_test",
  pool: Ecto.Adapters.SQL.Sandbox
