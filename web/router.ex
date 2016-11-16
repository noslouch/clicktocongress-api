defmodule Clicktocongress.Router do
  use Clicktocongress.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Clicktocongress do
    pipe_through :api
    
    get "/lookup", LookupController, :lookup
    get "/call", CallController, :call_me
    post "/connect", CallController, :dial_out
  end
end
