defmodule Clicktocongress.Zip do
  use Clicktocongress.Web, :model

  schema "zips" do
    field :address, :string
    field :latitude, :float
    field :longitude, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:address, :latitude, :longitude])
    |> validate_required([:address, :latitude, :longitude])
  end
end
