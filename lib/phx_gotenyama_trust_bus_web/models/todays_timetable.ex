defmodule TodaysTimetable do
  @spec lookup(String.t(), DateTime.t()) :: map()
  def lookup(from, now) do
    tt = timetable(from)
    today = to_date(now)

    if HolidayJp.holiday?(today) do
      tt.holiday
    else
      tt.weekday
    end
  end

  defp timetable(from) do
    case from do
      "shinagawa" -> Timetables.Shinagawa
      "gotenyama" -> Timetables.Gotenyama
      _ -> raise ArgumentError
    end
  end

  @spec to_date(DateTime.t()) :: Date.t()
  defp to_date(dt) do
    with {:ok, date} <- Date.new(dt.year, dt.month, dt.day), do: date
  end
end
