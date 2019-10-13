defmodule GotenyamaTrustBusWeb.TimetablesController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", %{
      shinagawa_timetables: Timetable.Shinagawa.all(),
      gotenyama_timetables: Timetable.Gotenyama.all()
    })
  end
end
