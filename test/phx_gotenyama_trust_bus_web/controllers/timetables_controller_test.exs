defmodule GotenyamaTrustBusWeb.TimeTablesControllerTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "index/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => %{
            "weekday" => TestUtils.key_to_string(Timetable.Shinagawa.weekday()),
            "holiday" => TestUtils.key_to_string(Timetable.Shinagawa.holiday())
          },
          "gotenyama" => %{
            "weekday" => TestUtils.key_to_string(Timetable.Gotenyama.weekday()),
            "holiday" => TestUtils.key_to_string(Timetable.Gotenyama.holiday())
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
