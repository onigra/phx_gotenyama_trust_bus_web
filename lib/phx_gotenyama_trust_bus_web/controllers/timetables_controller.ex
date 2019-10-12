defmodule GotenyamaTrustBusWeb.TimetablesController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    shinagawa = Timetable.Shinagawa.weekday()
    gotenyama = Timetable.Gotenyama.weekday()

    render(conn, "index.json", %{shinagawa: shinagawa, gotenyama: gotenyama})
  end
end
