defmodule NextBus do
  @spec lookup(map(), DateTime.t()) :: String.t()
  def lookup(timetable, now) do
    current = timetable[now.hour]
    list = Enum.filter(current, fn x -> x > now.minute end)
    "#{now.hour}:#{hd(list)}"
  end
end
