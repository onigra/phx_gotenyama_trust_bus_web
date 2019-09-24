defmodule Timetables do
  defmodule FromShinagawa do
    def weekday do
      %{
        7  => {30, 45},
        8  => {0, 8, 15, 20, 25, 30, 35, 40, 45, 50, 55},
        9  => {0, 6, 12, 18, 24, 30, 37, 44, 52},
        10 => {0, 15, 35, 55},
        11 => {15, 35, 55},
        12 => {13, 33, 53},
        13 => {13, 33, 53},
        14 => {13, 33, 53},
        15 => {14, 34, 54},
        16 => {14, 34, 54},
        17 => {14, 34, 54},
        18 => {14, 34, 45, 57},
        19 => {8, 20, 32, 41, 51},
        20 => {10, 25, 40, 55},
        21 => {15, 35, 55},
      }
    end

    def holiday do
      %{
        8  => {35, 55},
        9  => {15, 35, 55},
        10 => {15, 35, 55},
        11 => {15, 35, 55},
        12 => {15, 35, 55},
        13 => {15, 35, 55},
        14 => {15, 35, 55},
        15 => {15, 35, 55},
        16 => {15, 35, 55},
        17 => {15, 35, 55},
        18 => {15, 35, 55},
        19 => {15, 35, 55},
        20 => {15, 35, 55},
        21 => {15},
      }
    end
  end
end
