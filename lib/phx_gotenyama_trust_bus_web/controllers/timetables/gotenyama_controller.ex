defmodule GotenyamaTrustBusWeb.Timetables.ShinagawaController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    timetables = Timetable.Shinagawa.all()
    render(conn, "index.json", %{timetables: timetables})
  end

  def weekday(conn, _params) do
    timetables = Timetable.Shinagawa.weekday()
    render(conn, "weekday.json", %{timetables: timetables})
  end

  def holiday(conn, _params) do
    timetables = Timetable.Shinagawa.holiday()
    render(conn, "holiday.json", %{timetables: timetables})
  end
end
