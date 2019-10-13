defmodule GotenyamaTrustBusWeb.Timetables.GotenyamaViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
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
        GotenyamaTrustBusWeb.Timetables.GotenyamaView,
        "index.json",
        %{timetables: Timetables.gotenyama()}
      )

    # then
    assert expected == actual
  end
end
