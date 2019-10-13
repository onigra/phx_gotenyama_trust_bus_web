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

  def render("weekday.json", %{timetables: timetables}) do
    %{
      data: %{
        timetables: %{
          gotenyama: %{
            weekday: timetables
          }
        }
      }
    }
  end

  def render("holiday.json", %{timetables: timetables}) do
    %{
      data: %{
        timetables: %{
          gotenyama: %{
            holiday: timetables
          }
        }
      }
    }
  end
end
