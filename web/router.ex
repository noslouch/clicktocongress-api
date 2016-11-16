defmodule Clicktocongress.Router do
  use Clicktocongress.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Clicktocongress do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Clicktocongress do
    pipe_through :api
    get "/call", CallController, :call_me
    post "/connect", CallController, :dial_out
  end
end
