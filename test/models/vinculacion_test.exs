defmodule Prueba.VinculacionTest do
  use Prueba.ModelCase

  alias Prueba.Vinculacion

  @valid_attrs %{descripcion: "some content", image: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Vinculacion.changeset(%Vinculacion{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vinculacion.changeset(%Vinculacion{}, @invalid_attrs)
    refute changeset.valid?
  end
end
