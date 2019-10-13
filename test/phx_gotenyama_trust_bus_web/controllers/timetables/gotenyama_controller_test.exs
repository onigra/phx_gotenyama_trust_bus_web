defmodule GotenyamaTrustBusWeb.TimeTables.GotenyamaControllerTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "index/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
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
      |> get(Routes.gotenyama_path(conn, :index))
      |> json_response(200)

    # then
    assert expected == actual
  end

  test "weekday/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "gotenyama" => %{
            "weekday" => TestUtils.key_to_string(Timetable.Gotenyama.weekday())
          }
        }
      }
    }

    # when
    actual =
      conn
      |> get(Routes.gotenyama_path(conn, :weekday))
      |> json_response(200)

    # then
    assert expected == actual
  end

  test "holiday/2", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "timetables" => %{
          "gotenyama" => %{
            "holiday" => TestUtils.key_to_string(Timetable.Gotenyama.holiday())
          }
        }
      }
    }

    # when
    actual =
      conn
      |> get(Routes.gotenyama_path(conn, :holiday))
      |> json_response(200)

    # then
    assert expected == actual
  end
end
