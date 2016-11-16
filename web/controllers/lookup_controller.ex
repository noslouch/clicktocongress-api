defmodule Clicktocongress.LookupController do
  use Clicktocongress.Web, :controller
  
  def lookup(conn, %{"zip" => zip}) do
    params = GoogleMaps.lookup_zip(zip)
    lookup(conn, params)
  end
  
  def lookup(conn, params) do
    %{body: %{
      "results" => results
    }} = Sunlight.locate_legislator(params)
    render conn, %{data: results}
  end
end
