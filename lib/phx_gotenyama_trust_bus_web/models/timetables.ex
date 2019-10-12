defmodule Timetables do
  @spec all :: map()
  def all do
    %{
      'shinagawa' => shinagawa(),
      'gotenyama' => gotenyama()
    }
  end

  @spec shinagawa :: map()
  def shinagawa do
    %{
      'weekday' => Timetable.Shinagawa.weekday(),
      'holiday' => Timetable.Shinagawa.holiday()
    }
  end

  @spec gotenyama :: map()
  def gotenyama do
    %{
      'weekday' => Timetable.Gotenyama.weekday(),
      'holiday' => Timetable.Gotenyama.holiday()
    }
  end
end
