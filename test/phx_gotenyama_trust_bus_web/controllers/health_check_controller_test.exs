defmodule GotenyamaTrustBusWeb.HealthCheckControllerTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "index/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "ping" => "pong"
      }
    }

    # when
    actual =
      conn
      |> get(Routes.health_check_path(conn, :index))
      |> json_response(200)

    # then
    assert expected == actual
  end
end
