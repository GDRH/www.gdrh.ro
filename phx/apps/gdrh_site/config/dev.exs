use Mix.Config

# Configure your database
config :gdrh_site, GdrhSite.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "gdrh_george_dev",
  hostname: "localhost",
  pool_size: 10
