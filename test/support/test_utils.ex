defmodule TestUtils do
  def key_to_string(timetable) do
    Enum.reduce(
      timetable,
      %{},
      fn {key, val}, total ->
        Map.merge(total, %{Integer.to_string(key) => val})
      end
    )
  end
end
