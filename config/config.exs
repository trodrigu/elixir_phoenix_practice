# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :keep_talking,
  ecto_repos: [KeepTalking.Repo]

# Configures the endpoint
config :keep_talking, KeepTalking.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tz1aQuniASJE4V6b5lg/9JXmOFAD0M/2vqoGuj+pSgG80DtWcrrfw/eQvhWwwrdI",
  render_errors: [view: KeepTalking.ErrorView, accepts: ~w(html json)],
  pubsub: [name: KeepTalking.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
