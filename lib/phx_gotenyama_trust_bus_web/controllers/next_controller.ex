defmodule GotenyamaTrustBusWeb.NextController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, params) do
    from = params["from"]
    current_timestamp = current_datetime(params["now"])

    timetable = TodaysTimetable.lookup(from, current_timestamp)
    next_time = NextBus.lookup(timetable, current_timestamp)
    render(conn, "index.json", %{next_time: next_time})
  end

  defp current_datetime(now) when is_nil(now), do: Timex.local()
  defp current_datetime(now), do: Timex.parse!(now, "%FT%T%:z", :strftime)
end
