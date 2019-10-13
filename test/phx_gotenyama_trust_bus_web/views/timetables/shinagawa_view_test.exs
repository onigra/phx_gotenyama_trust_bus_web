defmodule GotenyamaTrustBusWeb.Timetables.ShinagawaViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
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
        GotenyamaTrustBusWeb.Timetables.ShinagawaView,
        "index.json",
        %{timetables: Timetables.shinagawa()}
      )

    # then
    assert expected == actual
  end
end
