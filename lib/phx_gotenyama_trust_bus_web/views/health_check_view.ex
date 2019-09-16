defmodule GotenyamaTrustBusWeb.HealthCheckView do
  use GotenyamaTrustBusWeb, :view

  def render("index.json", %{message: message}) do
    %{data: %{ping: message}}
  end
end
