defmodule GotenyamaTrustBusWeb.Timetables.GotenyamaController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    timetables = Timetable.Gotenyama.all()
    render(conn, "index.json", %{timetables: timetables})
  end

  def weekday(conn, _params) do
    timetables = Timetable.Gotenyama.weekday()
    render(conn, "weekday.json", %{timetables: timetables})
  end

  def holiday(conn, _params) do
    timetables = Timetable.Gotenyama.holiday()
    render(conn, "holiday.json", %{timetables: timetables})
  end
end
