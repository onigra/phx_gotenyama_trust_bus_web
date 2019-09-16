defmodule GotenyamaTrustBusWeb.HealthCheckController  do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", message: "pong")
  end
end
