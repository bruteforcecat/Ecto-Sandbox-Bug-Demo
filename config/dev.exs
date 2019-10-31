import Config

config :ecto_sandbox_bug_demo, EctoSandboxBugDemo.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ecto_sandbox_bug_demo",
  pool_size: 10,
  show_sensitive_data_on_connection_error: true
