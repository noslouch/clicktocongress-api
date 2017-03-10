defmodule Civic do
  import Application, only: [get_env: 2]
  use Tesla
  
  plug Tesla.Middleware.BaseUrl, "https://www.googleapis.com/civicinfo/v2"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Query, [key: get_env(:clicktocongress, :google_civic_key)]
  
  def get_reps(address) do
    %{body: %{
      "offices" => offices, # list
      "officials" => officials # list
    }} = get("representatives", query: [address: address])
    List.foldl(offices, [], fn(office, transformed) ->
      reps = Enum.map(office.officialIndices, &(officials[&1]))
    end)
  end
  
end
