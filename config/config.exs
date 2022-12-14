# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :api_phoenix,
  ecto_repos: [ApiPhoenix.Repo]

config :socketio_emitter, :redix_pool,
  redix_config: [
    host: "localhost",
    port: 6379
  ],
  # 5 Redix processes will be available (default value: 1)
  pool_size: 5

# Configures the endpoint
config :api_phoenix, ApiPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ApiPhoenixWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ApiPhoenix.PubSub,
  live_view: [signing_salt: "cLK5wpvy"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# MongoDB
config :mongodb_driver, log: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
