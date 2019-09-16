defmodule GotenyamaTrustBusWeb.HealthCheckView do
  use GotenyamaTrustBusWeb, :view

  def render("index.json", %{health_check: health_check}) do
    %{data: render_one(health_check, GotenyamaTrustBusWeb.HealthCheckView, "health_check.json")}
  end

  def render("health_check.json", %{health_check: health_check}) do
    %{ping: health_check.message}
  end
end
