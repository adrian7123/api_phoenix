defmodule ApiPhoenixWeb.EchoSocket do
  @behaviour Phoenix.Socket.Transport
  alias ApiPhoenixWeb.Models.Account

  def child_spec(_opts) do
    # We won't spawn any process, so let's return a dummy task
    %{id: __MODULE__, start: {Task, :start_link, [fn -> :ok end]}, restart: :transient}
  end

  def connect(state) do
    # Callback to retrieve relevant data from the connection.
    # The map contains options, params, transport and endpoint keys.
    IO.puts("connect")


    # sending to all clients
    {:ok, state}
  end

  def init(state) do
    # Now we are effectively inside the process that maintains the socket.
    {:ok, state}
  end

  def handle_in({"get_accounts", _opts}, state) do
    mongo_acc_list = Mongo.find(:mongo, "gn_acc", %{})|>IO.inspect

    acc_list = mongo_acc_list
      |>Enum.map(
        fn (acc) ->
          Account.toMap(acc)
        end
      )

    IO.inspect(acc_list)

    {:reply, :ok, {:text, Jason.encode!(acc_list)}, state}
  end

  def handle_in({text, _opts}, state) do
    {:reply, :ok, {:text, text}, state}
  end

  def handle_info(_, state) do
    {:ok, state}
  end

  def emit(text, state) do
    {:reply, :ok, {:text, text}, state}
  end

  def terminate(_reason, _state) do
    :ok
  end
end
