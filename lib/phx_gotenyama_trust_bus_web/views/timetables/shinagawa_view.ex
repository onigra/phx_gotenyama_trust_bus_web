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

  def render("weekday.json", %{timetables: timetables}) do
    %{
      data: %{
        timetables: %{
          shinagawa: %{
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
          shinagawa: %{
            holiday: timetables
          }
        }
      }
    }
  end
end
