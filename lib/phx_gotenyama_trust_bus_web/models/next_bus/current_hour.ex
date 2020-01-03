defmodule NextBus.CurrentHour do
  def lookup(timetable, now) do
    case timetable[now.hour] do
      nil ->
        {:error, "Bus is over."}

      tt ->
        next_min = next_minute(tt, now.minute)

        if is_nil(next_min) do
          {:error, "Bus is over."}
        else
          Timex.to_datetime(
            {
              {now.year, now.month, now.day},
              {now.hour, next_min, 0}
            },
            "Asia/Tokyo"
          )
          |> Timex.format!("{h24}:{m}")
          |> result()
        end
    end
  end

  defp next_minute(tt, minute) do
    Enum.filter(tt, fn x -> x > minute end)
    |> List.first()
  end

  defp result(next_bus) do
    {:ok, next_bus}
  end
end
