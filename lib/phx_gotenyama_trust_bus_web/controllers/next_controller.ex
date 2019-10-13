defmodule GotenyamaTrustBusWeb.NextController do
  use GotenyamaTrustBusWeb, :controller

  def index(conn, params) do
    tt = timetable(params["from"])
    now = Timex.local()
    today = to_date(now)

    t =
      if HolidayJp.holiday?(today) do
        tt.holiday
      else
        tt.weekday
      end

    current = t[now.hour]
    list = Enum.filter(current, fn x -> x > now.minute end)

    next_time = "#{now.hour}:#{hd(list)}"
    render(conn, "index.json", %{next_time: next_time})
  end

  defp timetable(from) do
    case from do
      "shinagawa" -> Timetables.Shinagawa
      "gotenyama" -> Timetables.Gotenyama
      _ -> raise ArgumentError
    end
  end

  defp to_date(datetime) do
    today = Date.new(datetime.year, datetime.month, datetime.day)
    elem(today, 1)
  end
end
