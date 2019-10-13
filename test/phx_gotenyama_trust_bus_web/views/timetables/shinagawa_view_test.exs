defmodule GotenyamaTrustBusWeb.Timetables.ShinagawaViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          shinagawa: Timetables.Shinagawa.all()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.Timetables.ShinagawaView,
        "index.json",
        %{timetables: Timetables.Shinagawa.all()}
      )

    # then
    assert expected == actual
  end

  test "renders weekday.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          shinagawa: Timetables.Shinagawa.weekday()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.Timetables.ShinagawaView,
        "index.json",
        %{timetables: Timetables.Shinagawa.weekday()}
      )

    # then
    assert expected == actual
  end

  test "renders holiday.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          shinagawa: Timetables.Shinagawa.holiday()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.Timetables.ShinagawaView,
        "index.json",
        %{timetables: Timetables.Shinagawa.holiday()}
      )

    # then
    assert expected == actual
  end
end
