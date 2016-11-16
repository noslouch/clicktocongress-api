defmodule GoogleMaps do
  use Tesla
  
  plug Tesla.Middleware.BaseUrl, "http://maps.googleapis.com/"
  plug Tesla.Middleware.JSON
  
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
