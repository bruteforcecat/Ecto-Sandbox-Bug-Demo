# EctoSandboxBugDemo

A simple elixir project to reproduce bug in Ecto sandbox mode.

To test:

 - `MIX_ENV=test mix ecto.create && ecto.migrate`
 - `mix test`
 - `see the failing test for shared mode and manual mode`
