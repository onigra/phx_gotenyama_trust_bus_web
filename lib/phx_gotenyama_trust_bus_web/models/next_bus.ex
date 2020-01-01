defmodule NextBus do
  @spec lookup(map(), DateTime.t()) :: String.t()
  def lookup(timetable, now) do
    case timetable[now.hour] do
      nil ->
        "Bus is over."

      _ ->
        current_tt =
          timetable[now.hour]
          |> Enum.filter(fn x -> x > now.minute end)

        case length(current_tt) do
          0 ->
            next_tt = timetable[now.hour + 1]

            if next_tt == nil do
              "Bus is over."
            else
              next_hour = Timex.shift(now, hours: 1)

              Timex.to_datetime(
                {
                  {next_hour.year, next_hour.month, next_hour.day},
                  {next_hour.hour, hd(next_tt), 0}
                },
                "Asia/Tokyo"
              )
              |> Timex.format!("{h24}:{m}")
            end

          _ ->
            "#{Timex.format!(now, "{h24}")}:#{hd(current_tt)}"
        end
    end
  end
end
