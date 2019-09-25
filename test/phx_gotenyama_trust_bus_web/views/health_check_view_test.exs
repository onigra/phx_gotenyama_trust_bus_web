defmodule GotenyamaTrustBusWeb.HealthCheckViewTest do
  use GotenyamaTrustBusWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.json" do
    assert render(GotenyamaTrustBusWeb.HealthCheckView, "index.json", %{message: "pong"})
      == %{data: %{ping: "pong"}}
  end
end
