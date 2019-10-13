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
        get "/", TimetablesController, :shinagawa
        get "/weekday", TimetablesController, :shinagawa_weekday
        get "/holiday", TimetablesController, :shinagawa_holiday
      end

      scope "/gotenyama" do
        get "/", TimetablesController, :gotenyama
        get "/weekday", TimetablesController, :gotenyama_weekday
        get "/holiday", TimetablesController, :gotenyama_holiday
      end
    end
  end
end
