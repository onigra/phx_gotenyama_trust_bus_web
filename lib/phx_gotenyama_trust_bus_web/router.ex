defmodule GotenyamaTrustBusWeb.Router do
  use GotenyamaTrustBusWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GotenyamaTrustBusWeb do
    pipe_through :api

    get "/ping", HealthCheckController, :index

    # 時刻表
    scope "/timetables" do
      get "/", TimetablesController, :index

      scope "/shinagawa" do
        get "/", Timetables.ShinagawaController, :index
        get "/weekday", Timetables.ShinagawaController, :weekday
        get "/holiday", Timetables.ShinagawaController, :holiday
      end

      scope "/gotenyama" do
        get "/", Timetables.GotenyamaController, :index
        get "/weekday", Timetables.GotenyamaController, :weekday
        get "/holiday", Timetables.GotenyamaController, :holiday
      end
    end
  end
end
