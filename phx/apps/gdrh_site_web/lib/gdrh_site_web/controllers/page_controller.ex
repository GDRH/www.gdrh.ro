defmodule GdrhSiteWeb.PageController do
  use GdrhSiteWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  def team(conn, _params) do
    render conn, "team.html"
  end

  def articles(conn, _params) do
    render conn, "articles.html"
  end

  def contact(conn, _params) do
    render conn, "contact.html"
  end

end
