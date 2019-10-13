defmodule GotenyamaTrustBusWeb.Timetables.ShinagawaController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    timetables = Timetables.shinagawa()
    render(conn, "index.json", %{timetables: timetables})
  end

  def weekday(conn, _params) do
    timetables = Timetables.shinagawa(:weekday)
    render(conn, "index.json", %{timetables: timetables})
  end

  def holiday(conn, _params) do
    timetables = Timetables.shinagawa(:holiday)
    render(conn, "index.json", %{timetables: timetables})
  end
end
