defmodule Rumbl.AnnnotationTest do
  use Rumbl.ModelCase

  alias Rumbl.Annnotation

  @valid_attrs %{at: 42, body: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Annnotation.changeset(%Annnotation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Annnotation.changeset(%Annnotation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
