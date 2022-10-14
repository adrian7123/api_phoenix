defmodule ApiPhoenixWeb.PageController do
  use ApiPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
