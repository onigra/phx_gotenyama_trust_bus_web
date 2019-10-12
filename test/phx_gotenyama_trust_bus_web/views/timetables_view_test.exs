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
end
