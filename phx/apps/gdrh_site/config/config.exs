use Mix.Config

config :gdrh_site, ecto_repos: [GdrhSite.Repo]

import_config "#{Mix.env}.exs"
