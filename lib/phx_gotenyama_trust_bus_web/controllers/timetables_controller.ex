defmodule GotenyamaTrustBusWeb.TimetablesController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, _params) do
    timetables = Timetables.all()
    render(conn, "index.json", %{timetables: timetables})
  end
end
