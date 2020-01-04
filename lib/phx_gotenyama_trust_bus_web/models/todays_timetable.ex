defmodule TodaysTimetable do
  @spec lookup(String.t(), DateTime.t()) :: map()
  def lookup(from, now) do
    timetable(from, HolidayJp.holiday?(to_date(now)))
  end

  @spec to_date(DateTime.t()) :: Date.t()
  defp to_date(dt) do
    with {:ok, date} <- Date.new(dt.year, dt.month, dt.day), do: date
  end

  defp timetable(from, holiday?) when from == "shinagawa" and holiday? == true,
    do: Timetables.Shinagawa.holiday()

  defp timetable(from, holiday?) when from == "shinagawa" and holiday? == false,
    do: Timetables.Shinagawa.weekday()

  defp timetable(from, holiday?) when from == "gotenyama" and holiday? == true,
    do: Timetables.Gotenyama.holiday()

  defp timetable(from, holiday?) when from == "gotenyama" and holiday? == false,
    do: Timetables.Gotenyama.weekday()
end
