defmodule GotenyamaTrustBusWeb.NextControllerTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "index/2 from shinagawa weekday 07:25", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "next" => "07:30"
      }
    }

    # and
    now =
      DateTime.from_naive!(
        ~N[2020-01-02 07:25:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )
      |> Timex.format!("{ISO:Extended}")

    # when
    actual =
      conn
      |> get(Routes.next_path(conn, :index, from: "shinagawa", now: now))
      |> json_response(200)

    # then
    assert expected == actual
  end

  test "index/2 from shinagawa weekday 23:25", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "next" => "Bus is over."
      }
    }

    # and
    now =
      DateTime.from_naive!(
        ~N[2020-01-02 23:25:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )
      |> Timex.format!("{ISO:Extended}")

    # when
    actual =
      conn
      |> get(Routes.next_path(conn, :index, from: "shinagawa", now: now))
      |> json_response(200)

    # then
    assert expected == actual
  end

  test "index/2 from gotenyama holiday 08:25", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "next" => "08:40"
      }
    }

    # and
    now =
      DateTime.from_naive!(
        ~N[2020-01-01 08:25:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )
      |> Timex.format!("{ISO:Extended}")

    # when
    actual =
      conn
      |> get(Routes.next_path(conn, :index, from: "gotenyama", now: now))
      |> json_response(200)

    # then
    assert expected == actual
  end

  test "index/2 from gotenyama holiday 05:10", %{conn: conn} do
    # setup
    expected = %{
      "data" => %{
        "next" => "Bus is over."
      }
    }

    # and
    now =
      DateTime.from_naive!(
        ~N[2020-01-01 05:10:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )
      |> Timex.format!("{ISO:Extended}")

    # when
    actual =
      conn
      |> get(Routes.next_path(conn, :index, from: "gotenyama", now: now))
      |> json_response(200)

    # then
    assert expected == actual
  end
end
