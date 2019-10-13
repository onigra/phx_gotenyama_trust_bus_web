defmodule GotenyamaTrustBusWeb.TimetablesView do
  use GotenyamaTrustBusWeb, :view

  def render("index.json", %{
        shinagawa_timetables: shinagawa_timetables,
        gotenyama_timetables: gotenyama_timetables
      }) do
    %{
      data: %{
        timetables: %{
          shinagawa: shinagawa_timetables,
          gotenyama: gotenyama_timetables
        }
      }
    }
  end
end
