defmodule GotenyamaTrustBusWeb.HealthCheckController  do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    json(conn, %{ping: "pong"})
  end
end
