defmodule GotenyamaTrustBusWeb.TimetablesViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
    # setup
    expected = %{
      data: %{
        timetables: %{
          shinagawa: Timetables.Shinagawa.all(),
          gotenyama: Timetables.Gotenyama.all()
        }
      }
    }

    # when
    actual =
      render(
        GotenyamaTrustBusWeb.TimetablesView,
        "index.json",
        %{
          shinagawa_timetables: Timetables.Shinagawa.all(),
          gotenyama_timetables: Timetables.Gotenyama.all()
        }
      )

    # then
    assert expected == actual
  end
end
