defmodule GotenyamaTrustBusWeb.NextController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, params) do
    now = Timex.local()
    timetable = TodaysTimetable.lookup(params["from"], now)
    next_time = NextBus.lookup(timetable, now)
    render(conn, "index.json", %{next_time: next_time})
  end
end
