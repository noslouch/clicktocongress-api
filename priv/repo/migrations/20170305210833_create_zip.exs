defmodule Clicktocongress.Repo.Migrations.CreateZip do
  use Ecto.Migration

  def change do
    create table(:zips) do
      add :address, :string
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end

  end
end
