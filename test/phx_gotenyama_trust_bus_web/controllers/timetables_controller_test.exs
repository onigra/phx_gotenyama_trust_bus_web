defmodule GotenyamaTrustBusWeb.TimeTablesControllerTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  def key_to_string(timetable) do
    Enum.reduce(
      timetable,
      %{},
      fn {key, val}, total ->
        Map.merge(total, %{Integer.to_string(key) => val})
      end
    )
  end

  test "index/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => %{
            "weekday" => key_to_string(Timetable.Shinagawa.weekday()),
            "holiday" => key_to_string(Timetable.Shinagawa.holiday())
          },
          "gotenyama" => %{
            "weekday" => key_to_string(Timetable.Gotenyama.weekday()),
            "holiday" => key_to_string(Timetable.Gotenyama.holiday())
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

  test "shinagawa/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => %{
            "weekday" => key_to_string(Timetable.Shinagawa.weekday()),
            "holiday" => key_to_string(Timetable.Shinagawa.holiday())
          }
        }
      }
    }

    # when
    actual =
      conn
      |> get(Routes.timetables_path(conn, :shinagawa))
      |> json_response(200)

    # then
    assert expected == actual
  end

  test "shinagawa_weekday/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => %{
            "weekday" => key_to_string(Timetable.Shinagawa.weekday())
          }
        }
      }
    }

    # when
    actual =
      conn
      |> get(Routes.timetables_path(conn, :shinagawa_weekday))
      |> json_response(200)

    # then
    assert expected == actual
  end

  test "shinagawa_holiday/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => %{
            "holiday" => key_to_string(Timetable.Shinagawa.holiday())
          }
        }
      }
    }

    # when
    actual =
      conn
      |> get(Routes.timetables_path(conn, :shinagawa_holiday))
      |> json_response(200)

    # then
    assert expected == actual
  end
end
