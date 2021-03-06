defmodule NextBus.CurrentHour do
  @spec lookup(map(), DateTime.t()) :: {:error, :bus_is_over} | {:ok, String.t()}
  def lookup(timetable, now) do
    case timetable[now.hour] do
      nil ->
        {:error, :bus_is_over}

      tt ->
        next_min = next_minute(tt, now.minute)

        if is_nil(next_min) do
          {:error, :bus_is_over}
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
