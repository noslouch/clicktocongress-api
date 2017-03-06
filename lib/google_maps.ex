defmodule GoogleMaps do
  import Application, only: [get_env: 2]
  use Tesla
  
  plug Tesla.Middleware.BaseUrl, "http://maps.googleapis.com/"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Query, [API_KEY: get_env(:clicktocongress, :google_maps_key)]
  
  def lookup_zip(zip) do
    %{body: %{"results" => [%{
      "geometry" => %{
        "location" => %{
          "lat" => latitude,
          "lng" => longitude
        }
      }
      }]}} = get("maps/api/geocode/json", query: [address: zip])
      
    %{"latitude" => latitude, "longitude" => longitude}
  end
end
