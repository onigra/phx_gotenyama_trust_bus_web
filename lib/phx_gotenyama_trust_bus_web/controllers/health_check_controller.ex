defmodule GotenyamaTrustBusWeb.HealthCheckController  do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    health_check = %{message: "pong"}
    render(conn, "index.json", health_check: health_check)
  end
end
