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
end
