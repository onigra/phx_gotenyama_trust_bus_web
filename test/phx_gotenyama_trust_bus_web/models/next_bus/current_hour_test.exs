defmodule GotenyamaTrustBusWeb.NextBus.CurrentHourTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "lookup next bus" do
    # setup
    timetable = Timetables.Gotenyama.holiday()

    now =
      DateTime.from_naive!(
        ~N[2020-01-01 12:00:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = {:ok, "12:20"}

    # when
    actual = NextBus.CurrentHour.lookup(timetable, now)

    # then
    assert actual == expected
  end

  test "today's bus is over" do
    # setup
    timetable = Timetables.Gotenyama.holiday()

    now =
      DateTime.from_naive!(
        ~N[2020-01-01 23:00:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = {:error, :bus_is_over}

    # when
    actual = NextBus.CurrentHour.lookup(timetable, now)

    # then
    assert actual == expected
  end

  test "current hour bus is over" do
    # setup
    timetable = Timetables.Gotenyama.holiday()

    now =
      DateTime.from_naive!(
        ~N[2020-01-01 08:45:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = {:error, :bus_is_over}

    # when
    actual = NextBus.CurrentHour.lookup(timetable, now)

    # then
    assert actual == expected
  end
end
