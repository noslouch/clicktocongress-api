defmodule Clicktocongress.ZipTest do
  use Clicktocongress.ModelCase

  alias Clicktocongress.Zip

  @valid_attrs %{address: "some content", latitude: "120.5", longitude: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Zip.changeset(%Zip{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Zip.changeset(%Zip{}, @invalid_attrs)
    refute changeset.valid?
  end
end
