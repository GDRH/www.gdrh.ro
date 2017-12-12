defmodule GdrhSite.Application do
  @moduledoc """
  The GdrhSite Application Service.

  The gdrh_site system business domain lives in this application.

  Exposes API to clients such as the `GdrhSiteWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(GdrhSite.Repo, []),
    ], strategy: :one_for_one, name: GdrhSite.Supervisor)
  end
end
