defmodule NextBus do
  require OK

  @spec lookup(map(), DateTime.t()) :: String.t()
  def lookup(timetable, now) do
    OK.try do
      result <- NextBus.CurrentHour.lookup(timetable, now)
    after
      result
    rescue
      :bus_is_over -> lookup_next_hour(timetable, now)
    end
  end

  defp lookup_next_hour(timetable, now) do
    OK.try do
      result <- NextBus.NextHour.lookup(timetable, now)
    after
      result
    rescue
      :bus_is_over -> "Bus is over."
    end
  end
end
