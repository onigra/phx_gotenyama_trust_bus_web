defmodule GotenyamaTrustBusWeb.Timetables.GotenyamaController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    timetables = Timetables.gotenyama()
    render(conn, "index.json", %{timetables: timetables})
  end

  def weekday(conn, _params) do
    timetables = Timetables.gotenyama(:weekday)
    render(conn, "index.json", %{timetables: timetables})
  end

  def holiday(conn, _params) do
    timetables = Timetables.gotenyama(:holiday)
    render(conn, "index.json", %{timetables: timetables})
  end
end
