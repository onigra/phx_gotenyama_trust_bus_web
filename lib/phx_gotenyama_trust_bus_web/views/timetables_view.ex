defmodule GotenyamaTrustBusWeb.TimetablesView do
  use GotenyamaTrustBusWeb, :view

  def render("index.json", %{timetables: timetables}) do
    %{
      data: %{
        timetables: timetables
      }
    }
  end
end
