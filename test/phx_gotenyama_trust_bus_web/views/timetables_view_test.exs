defmodule GotenyamaTrustBusWeb.TimetablesViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
    # setup
    expected = %{
      data: %{
        timetables: Timetables.all()
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.TimetablesView,
        "index.json",
        %{timetables: Timetables.all()}
      )

    # then
    assert expected == actual
  end

  test "renders shinagawa.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          shinagawa: Timetables.shinagawa()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.TimetablesView,
        "shinagawa.json",
        %{timetables: Timetables.shinagawa()}
      )

    # then
    assert expected == actual
  end

  test "renders gotenyama.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          gotenyama: Timetables.gotenyama()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.TimetablesView,
        "gotenyama.json",
        %{timetables: Timetables.gotenyama()}
      )

    # then
    assert expected == actual
  end
end
