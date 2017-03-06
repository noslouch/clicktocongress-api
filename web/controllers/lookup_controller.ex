defmodule Clicktocongress.LookupController do
  alias Clicktocongress.Zip
  
  use Clicktocongress.Web, :controller
  
  def lookup(conn, %{"zip" => zip}) do
    case Repo.get_by Zip, address: zip do
      nil -> 
        results = GoogleMaps.lookup_zip(zip)
        Zip.changeset(%Zip{}, Map.merge(%{"address" => zip}, results))
          |> Repo.insert
        lookup(conn, results)
      %{latitude: lat, longitude: long} ->
        lookup(conn, %{"latitude" => lat, "longitude" => long})
    end
  end
  
  def lookup(conn, params) do
    %{body: %{
      "results" => results
    }} = Sunlight.locate_legislator(params)
    render conn, %{data: results}
  end
end
