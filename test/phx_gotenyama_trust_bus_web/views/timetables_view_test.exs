defmodule GotenyamaTrustBusWeb.TimetablesViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          shinagawa: Timetable.Shinagawa.all(),
          gotenyama: Timetable.Gotenyama.all()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.TimetablesView,
        "index.json",
        %{
          shinagawa_timetables: Timetable.Shinagawa.all(),
          gotenyama_timetables: Timetable.Gotenyama.all()
        }
      )

    # then
    assert expected == actual
  end
end
