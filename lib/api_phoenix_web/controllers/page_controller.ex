defmodule ApiPhoenixWeb.PageController do
  use ApiPhoenixWeb, :controller

  def index(conn, _params) do

    # Starts an unpooled connection
    {:ok, con} = Mongo.start_link(url: "mongodb://localhost:27017/teste")

    # Gets an enumerable cursor for the results
    cursor = Mongo.find(con, "asd", %{})

    cursor
    |> Enum.to_list()
    |> IO.inspect

    msg = %{:text => "hello"}

    render(conn, "index.html")
  end
end
