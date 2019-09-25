defmodule GotenyamaTrustBusWeb.TimetablesView do
  use GotenyamaTrustBusWeb, :view

  def render("index.json", %{shinagawa: shinagawa, gotenyama: gotenyama}) do
    %{
      data: %{
        timetables: %{
          shinagawa: shinagawa,
          gotenyama: gotenyama
        }
      }
    }
  end
end
