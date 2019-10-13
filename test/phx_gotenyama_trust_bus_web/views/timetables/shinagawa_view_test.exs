defmodule GotenyamaTrustBusWeb.Timetables.ShinagawaViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          shinagawa: Timetable.Shinagawa.all()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.Timetables.ShinagawaView,
        "index.json",
        %{timetables: Timetable.Shinagawa.all()}
      )

    # then
    assert expected == actual
  end

  test "renders weekday.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          shinagawa: Timetable.Shinagawa.weekday()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.Timetables.ShinagawaView,
        "index.json",
        %{timetables: Timetable.Shinagawa.weekday()}
      )

    # then
    assert expected == actual
  end

  test "renders holiday.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          shinagawa: Timetable.Shinagawa.holiday()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.Timetables.ShinagawaView,
        "index.json",
        %{timetables: Timetable.Shinagawa.holiday()}
      )

    # then
    assert expected == actual
  end
end
