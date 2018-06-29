# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :twitterbot,
  ecto_repos: [Twitterbot.Repo]

# Configures the endpoint
config :twitterbot, TwitterbotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XqFQrJtzQffyGfvpc/2lmNL6aPVfJ2+LO6akspC6G4OABZ6fFGz4oOaItm5zqC8t",
  render_errors: [view: TwitterbotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Twitterbot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
