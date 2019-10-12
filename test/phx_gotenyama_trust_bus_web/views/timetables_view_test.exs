defmodule GotenyamaTrustBusWeb.TimetablesViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
    # setup
    shinagawa_timetables = Timetable.Shinagawa.weekday()
    gotenyama_timetables = Timetable.Gotenyama.weekday()

    # and
    expected = %{
      data: %{
        timetables: %{
          shinagawa: shinagawa_timetables,
          gotenyama: gotenyama_timetables
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.TimetablesView,
        "index.json",
        %{shinagawa: shinagawa_timetables, gotenyama: gotenyama_timetables}
      )

    # then
    assert expected == actual
  end
end
