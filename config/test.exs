use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :clicktocongress, Clicktocongress.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :clicktocongress, Clicktocongress.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "clicktocongress_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"
