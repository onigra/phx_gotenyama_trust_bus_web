defmodule GotenyamaTrustBusWeb.Timetables.ShinagawaView do
  use GotenyamaTrustBusWeb, :view

  def render("index.json", %{timetables: timetables}) do
    %{
      data: %{
        timetables: %{
          shinagawa: timetables
        }
      }
    }
  end
end
