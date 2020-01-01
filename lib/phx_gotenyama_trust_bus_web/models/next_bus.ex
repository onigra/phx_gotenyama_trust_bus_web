defmodule NextBus do
  @spec lookup(map(), DateTime.t()) :: String.t()
  def lookup(timetable, now) do
    case timetable[now.hour] do
      # 現在時の時刻表が無い
      nil ->
        "Bus is over."

      # 現在時の時刻表がある
      _ ->
        current_tt =
          timetable[now.hour]
          |> Enum.filter(fn x -> x > now.minute end)

        case length(current_tt) do
          # 現在時の最後のバスが無い
          0 ->
            next_tt = timetable[now.hour + 1]

            # 次の時刻の時刻表が無い
            case next_tt do
              nil ->
                "Bus is over."

              # 次の時刻の時刻表がある場合、直近のバスの時刻を返す
              _ ->
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

          # 現在時の次のバスがある場合、直近のバスの時刻を返す
          _ ->
            "#{Timex.format!(now, "{h24}")}:#{hd(current_tt)}"
        end
    end
  end
end
