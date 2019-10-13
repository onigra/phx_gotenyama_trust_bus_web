defmodule GotenyamaTrustBusWeb.NextController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    next_time = "12:05"
    render(conn, "index.json", %{next_time: next_time})
  end
end
