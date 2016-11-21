defmodule Clicktocongress.LookupView do
  use Clicktocongress.Web, :view
  
  @keys ~w{first_name last_name phone title party district bioguide_id}
  
  def render("lookup.json", %{data: data}) do
    data
    |> Enum.map(&(Map.take(&1, @keys)))
  end
end
