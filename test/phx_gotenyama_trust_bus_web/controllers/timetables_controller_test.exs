defmodule GotenyamaTrustBusWeb.TimeTablesControllerTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "index/2", %{conn: conn} do
    # setup
    shinagawa_timetables =
      Enum.reduce(
        Timetables.FromShinagawa.weekday, %{}, fn({key, val}, total) ->
          Map.merge(total, %{Integer.to_string(key) => val})
        end
      )

    # and
    gotenyama_timetables =
      Enum.reduce(
        Timetables.FromGotenyama.weekday, %{}, fn({key, val}, total) ->
          Map.merge(total, %{Integer.to_string(key) => val})
        end
      )

    # and
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => shinagawa_timetables,
          "gotenyama" => gotenyama_timetables,
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
