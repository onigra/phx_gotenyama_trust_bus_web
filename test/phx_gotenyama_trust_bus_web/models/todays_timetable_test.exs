defmodule GotenyamaTrustBusWeb.TodaysTimetableTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  test "lookup from Shinagawa at weekday" do
    # setup
    from = "shinagawa"

    now =
      DateTime.from_naive!(
        ~N[2020-01-02 12:00:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = Timetables.Shinagawa.weekday()

    # when
    actual = TodaysTimetable.lookup(from, now)

    # then
    assert actual == expected
  end

  test "lookup from Shinagawa at holiday" do
    # setup
    from = "shinagawa"

    now =
      DateTime.from_naive!(
        ~N[2020-01-01 12:00:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = Timetables.Shinagawa.holiday()

    # when
    actual = TodaysTimetable.lookup(from, now)

    # then
    assert actual == expected
  end

  test "lookup from Gotenyama at weekday" do
    # setup
    from = "gotenyama"

    now =
      DateTime.from_naive!(
        ~N[2020-01-02 12:00:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = Timetables.Gotenyama.weekday()

    # when
    actual = TodaysTimetable.lookup(from, now)

    # then
    assert actual == expected
  end

  test "lookup from Gotenyama at holiday" do
    # setup
    from = "gotenyama"

    now =
      DateTime.from_naive!(
        ~N[2020-01-01 12:00:00],
        "Asia/Tokyo",
        Tzdata.TimeZoneDatabase
      )

    # and
    expected = Timetables.Gotenyama.holiday()

    # when
    actual = TodaysTimetable.lookup(from, now)

    # then
    assert actual == expected
  end
end
