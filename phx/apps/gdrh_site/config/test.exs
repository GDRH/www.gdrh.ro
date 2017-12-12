use Mix.Config

# Configure your database
config :gdrh_site, GdrhSite.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "gdrh_site_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
