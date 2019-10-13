defmodule GotenyamaTrustBusWeb.Timetables.GotenyamaView do
  use GotenyamaTrustBusWeb, :view

  def render("index.json", %{timetables: timetables}) do
    %{
      data: %{
        timetables: %{
          gotenyama: timetables
        }
      }
    }
  end
end
