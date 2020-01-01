defmodule GotenyamaTrustBusWeb.NextController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, params) do
    timetable = TodaysTimetable.lookup(params["from"], current_timestamp(params["now"]))
    next_time = NextBus.lookup(timetable, current_timestamp(params["now"]))
    render(conn, "index.json", %{next_time: next_time})
  end

  defp current_timestamp(now) do
    if now == nil do
      Timex.local()
    else
      Timex.parse!(now, "%FT%T%:z", :strftime)
    end
  end
end
