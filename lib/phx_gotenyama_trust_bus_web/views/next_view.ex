defmodule GotenyamaTrustBusWeb.NextView do
  use GotenyamaTrustBusWeb, :view

  def render("index.json", %{next_time: next_time}) do
    IO.puts(next_time)
    %{data: %{next: next_time}}
  end
end
