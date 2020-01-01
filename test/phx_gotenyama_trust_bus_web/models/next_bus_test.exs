defmodule GotenyamaTrustBusWeb.NextBusTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "lookup next bus" do
    # setup
    timetable = Timetables.Shinagawa.weekday()

    now =
      DateTime.from_naive!(
        ~N[2020-01-01 12:00:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = "12:13"

    # when
    actual = NextBus.lookup(timetable, now)

    # then
    assert actual == expected
  end

  test "lookup next bus from next hour timetable" do
    # setup
    timetable = Timetables.Shinagawa.weekday()

    now =
      DateTime.from_naive!(
        ~N[2020-01-01 07:46:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = "08:00"

    # when
    actual = NextBus.lookup(timetable, now)

    # then
    assert actual == expected
  end

  test "Bus is over" do
    # setup
    timetable = Timetables.Shinagawa.weekday()

    now =
      DateTime.from_naive!(
        ~N[2020-01-01 23:30:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = "Bus is over."

    # when
    actual = NextBus.lookup(timetable, now)

    # then
    assert actual == expected
  end

  test "Next bus is nothing" do
    # setup
    timetable = Timetables.Shinagawa.weekday()

    now =
      DateTime.from_naive!(
        ~N[2020-01-01 21:56:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = "Bus is over."

    # when
    actual = NextBus.lookup(timetable, now)

    # then
    assert actual == expected
  end
end
