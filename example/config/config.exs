# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :live_phone_example, LivePhoneExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DC7N7zO/AVr5qqVk+ZRAm1PM4arGnoZ7847JlrRmUknGCbFIdcL14+wF9Ws085mU",
  render_errors: [view: LivePhoneExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LivePhoneExample.PubSub,
  live_view: [signing_salt: "NsyigQtD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :esbuild,
  version: "0.13.4",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
