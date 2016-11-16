# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :clicktocongress, Clicktocongress.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5cJUIHLC2ibVePDaKy7AY7h9fqyOtdiaVZ0CX2noJK/bGghsoFs7uXFniy34G2C0",
  render_errors: [view: Clicktocongress.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Clicktocongress.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
  
config :ex_twilio, account_sid: System.get_env("TWILIO_ACCOUNT_SID") || "${TWILIO_ACCOUNT_SID}",
                   auth_token:  System.get_env("TWILIO_AUTH_TOKEN") || "${TWILIO_AUTH_TOKEN}"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
