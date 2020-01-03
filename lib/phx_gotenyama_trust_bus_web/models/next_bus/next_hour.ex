defmodule NextBus.NextHour do
  def lookup(timetable, now) do
    case timetable[now.hour + 1] do
      nil ->
        {:error, "Bus is over."}

      tt ->
        Timex.to_datetime(
          {
            {now.year, now.month, now.day},
            {now.hour + 1, hd(tt), 0}
          },
          "Asia/Tokyo"
        )
        |> Timex.format!("{h24}:{m}")
        |> result()
    end
  end

  defp result(next_bus) do
    {:ok, next_bus}
  end
end
