defmodule GotenyamaTrustBusWeb.TimeTablesControllerTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "index/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => %{
            "weekday" => Timetables.Shinagawa.weekday() |> TestUtils.key_to_string(),
            "holiday" => Timetables.Shinagawa.holiday() |> TestUtils.key_to_string()
          },
          "gotenyama" => %{
            "weekday" => Timetables.Gotenyama.weekday() |> TestUtils.key_to_string(),
            "holiday" => Timetables.Gotenyama.holiday() |> TestUtils.key_to_string()
          }
        }
      }
    }

    # when
    actual =
      conn
      |> get(Routes.timetables_path(conn, :index))
      |> json_response(200)

    # then
    assert expected == actual
  end
end
