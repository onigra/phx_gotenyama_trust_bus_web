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

  @spec shinagawa(atom()) :: map()
  def shinagawa(date_type) do
    case date_type do
      :weekday -> %{'weekday' => Timetable.Shinagawa.weekday()}
      :holiday -> %{'holiday' => Timetable.Shinagawa.holiday()}
      _ -> shinagawa()
    end
  end

  @spec gotenyama() :: map()
  def gotenyama() do
    %{
      'weekday' => Timetable.Gotenyama.weekday(),
      'holiday' => Timetable.Gotenyama.holiday()
    }
  end

  @spec gotenyama(atom()) :: map()
  def gotenyama(date_type) do
    case date_type do
      :weekday -> %{'weekday' => Timetable.Gotenyama.weekday()}
      :holiday -> %{'holiday' => Timetable.Gotenyama.holiday()}
      _ -> gotenyama()
    end
  end
end
