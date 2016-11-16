defmodule Sunlight do
  use Tesla
  
  plug Tesla.Middleware.BaseUrl, "https://congress.api.sunlightfoundation.com/"
  plug Tesla.Middleware.JSON
  
  def locate_legislator(%{"latitude" => latitude, "longitude" => longitude}) do
    get("legislators/locate", query: [latitude: latitude, longitude: longitude])
  end
end
