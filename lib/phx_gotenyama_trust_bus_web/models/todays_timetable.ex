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

  defp to_date(datetime) do
    Date.new(datetime.year, datetime.month, datetime.day)
    |> elem(1)
  end
end
