defmodule GotenyamaTrustBusWeb.Timetables.GotenyamaViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          gotenyama: Timetables.Gotenyama.all()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.Timetables.GotenyamaView,
        "index.json",
        %{timetables: Timetables.Gotenyama.all()}
      )

    # then
    assert expected == actual
  end

  test "renders weekday.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          gotenyama: Timetables.Gotenyama.weekday()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.Timetables.GotenyamaView,
        "index.json",
        %{timetables: Timetables.Gotenyama.weekday()}
      )

    # then
    assert expected == actual
  end

  test "renders holiday.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          gotenyama: Timetables.Gotenyama.holiday()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.Timetables.GotenyamaView,
        "index.json",
        %{timetables: Timetables.Gotenyama.holiday()}
      )

    # then
    assert expected == actual
  end
end
