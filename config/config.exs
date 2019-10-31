# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :ecto_sandbox_bug_demo, EctoSandboxBugDemo.Repo,
  database: "ecto_sandbox_bug_demo_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :ecto_sandbox_bug_demo,
  ecto_repos: [EctoSandboxBugDemo.Repo]

import_config "#{Mix.env()}.exs"
