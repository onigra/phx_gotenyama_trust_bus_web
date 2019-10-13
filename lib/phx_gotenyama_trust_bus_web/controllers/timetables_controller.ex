defmodule GotenyamaTrustBusWeb.TimetablesController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    timetables = Timetables.all()
    render(conn, "index.json", %{timetables: timetables})
  end

  def shinagawa(conn, _params) do
    timetables = Timetables.shinagawa()
    render(conn, "shinagawa.json", %{timetables: timetables})
  end

  def gotenyama(conn, _params) do
    timetables = Timetables.gotenyama()
    render(conn, "gotenyama.json", %{timetables: timetables})
  end
end
