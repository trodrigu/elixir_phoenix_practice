Code.require_file "../info_sys/test/backends/http_client.exs"
ExUnit.start

Mix.Task.run "ecto.create", ~w(-r KeepTalking.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r KeepTalking.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(KeepTalking.Repo, :manual)
