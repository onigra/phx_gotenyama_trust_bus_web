defmodule GotenyamaTrustBusWeb.Router do
  use GotenyamaTrustBusWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GotenyamaTrustBusWeb do
    pipe_through :api
  end
end
