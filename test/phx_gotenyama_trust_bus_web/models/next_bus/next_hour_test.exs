defmodule GotenyamaTrustBusWeb.NextBus.NextHourTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "lookup next bus" do
    # setup
    timetable = Timetables.Gotenyama.weekday()

    now =
      DateTime.from_naive!(
        ~N[2020-01-02 12:45:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = {:ok, "13:00"}

    # when
    actual = NextBus.NextHour.lookup(timetable, now)

    # then
    assert actual == expected
  end

  test "today's bus is over" do
    # setup
    timetable = Timetables.Gotenyama.weekday()

    now =
      DateTime.from_naive!(
        ~N[2020-01-02 22:00:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = {:error, :bus_is_over}

    # when
    actual = NextBus.NextHour.lookup(timetable, now)

    # then
    assert actual == expected
  end
end
