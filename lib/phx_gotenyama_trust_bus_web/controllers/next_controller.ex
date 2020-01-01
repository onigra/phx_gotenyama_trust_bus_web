defmodule GotenyamaTrustBusWeb.NextController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, params) do
    from = params["from"]
    current_timestamp = current_datetime(params["now"])

    timetable = TodaysTimetable.lookup(from, current_timestamp)
    next_time = NextBus.lookup(timetable, current_timestamp)
    render(conn, "index.json", %{next_time: next_time})
  end

  defp current_datetime(now) do
    if now == nil do
      Timex.local()
    else
      Timex.parse!(now, "%FT%T%:z", :strftime)
    end
  end
end
