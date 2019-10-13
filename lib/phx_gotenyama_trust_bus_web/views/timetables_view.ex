defmodule GotenyamaTrustBusWeb.TimetablesView do
  use GotenyamaTrustBusWeb, :view

  def render("index.json", %{timetables: timetables}) do
    %{
      data: %{
        timetables: timetables
      }
    }
  end

  def render("shinagawa.json", %{timetables: timetables}) do
    %{
      data: %{
        timetables: %{
          shinagawa: timetables
        }
      }
    }
  end

  def render("gotenyama.json", %{timetables: timetables}) do
    %{
      data: %{
        timetables: %{
          gotenyama: timetables
        }
      }
    }
  end
end
