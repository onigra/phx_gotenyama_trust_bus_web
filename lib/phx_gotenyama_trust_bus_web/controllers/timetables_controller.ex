defmodule GotenyamaTrustBusWeb.TimetablesController  do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    shinagawa = Timetables.FromShinagawa.weekday
    gotenyama = Timetables.FromGotenyama.weekday

    render(conn, "index.json", %{shinagawa: shinagawa, gotenyama: gotenyama})
  end
end
