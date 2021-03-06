defmodule GdrhSiteWeb.Router do
  use GdrhSiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GdrhSiteWeb do
    pipe_through :browser # Use the default browser stack

    get "/",          PageController, :index
    get "/about",     PageController, :about
    get "/team",      PageController, :team
    get "/articles",  PageController, :articles
    get "/contact",   PageController, :contact
    
    resources "/members", MemberController

  end

  # Other scopes may use custom stacks.
  # scope "/api", GdrhSiteWeb do
  #   pipe_through :api
  # end
end
