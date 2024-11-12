defmodule StonewallPickleballWeb.PlayerController do
  use StonewallPickleballWeb, :controller

  def index(conn, _params) do
    players = [%{id: 1, name: "Player 1"}, %{id: 2, name: "Player 2"}]
    json(conn, players)
  end

end
