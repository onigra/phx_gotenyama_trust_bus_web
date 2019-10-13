defmodule GotenyamaTrustBusWeb.TimeTables.ShinagawaControllerTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "index/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => %{
            "weekday" => TestUtils.key_to_string(Timetable.Shinagawa.weekday()),
            "holiday" => TestUtils.key_to_string(Timetable.Shinagawa.holiday())
          }
        }
      }
    }

    # when
    actual =
      conn
      |> get(Routes.shinagawa_path(conn, :index))
      |> json_response(200)

    # then
    assert expected == actual
  end

  test "weekday/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => %{
            "weekday" => TestUtils.key_to_string(Timetable.Shinagawa.weekday())
          }
        }
      }
    }

    # when
    actual =
      conn
      |> get(Routes.shinagawa_path(conn, :weekday))
      |> json_response(200)

    # then
    assert expected == actual
  end

  test "holiday/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "shinagawa" => %{
            "holiday" => TestUtils.key_to_string(Timetable.Shinagawa.holiday())
          }
        }
      }
    }

    # when
    actual =
      conn
      |> get(Routes.shinagawa_path(conn, :holiday))
      |> json_response(200)

    # then
    assert expected == actual
  end
end
