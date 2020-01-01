defmodule NextBus do
  @spec lookup(map(), DateTime.t()) :: String.t()
  def lookup(timetable, now) do
    current_tt =
      timetable[now.hour]
      |> Enum.filter(fn x -> x > now.minute end)

    if length(current_tt) == 0 do
      next_tt = timetable[now.hour + 1]
      next_hour = Timex.shift(now, hours: 1)

      Timex.to_datetime(
        {
          {next_hour.year, next_hour.month, next_hour.day},
          {next_hour.hour, hd(next_tt), 0}
        },
        "Asia/Tokyo"
      )
      |> Timex.format!("{h24}:{m}")
    else
      "#{Timex.format!(now, "{h24}")}:#{hd(current_tt)}"
    end
  end
end
