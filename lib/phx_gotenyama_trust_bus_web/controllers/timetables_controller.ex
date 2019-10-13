defmodule GotenyamaTrustBusWeb.TimetablesController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", %{
      shinagawa_timetables: Timetables.Shinagawa.all(),
      gotenyama_timetables: Timetables.Gotenyama.all()
    })
  end
end
