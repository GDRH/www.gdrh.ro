# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gdrh_site_web,
  namespace: GdrhSiteWeb,
  ecto_repos: [GdrhSite.Repo]

# Configures the endpoint
config :gdrh_site_web, GdrhSiteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/kHu5aCbso5eK2FkO2lgaLIlLGN1c672DWqPS4o+GB/W8/2006Vu8yZjo8CbdDlE",
  render_errors: [view: GdrhSiteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GdrhSiteWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :gdrh_site_web, :generators,
  context_app: :gdrh_site

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
