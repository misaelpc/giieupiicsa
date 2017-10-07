defmodule Prueba.InvestigadorTest do
  use Prueba.ModelCase

  alias Prueba.Investigador

  @valid_attrs %{academica: "some content", actividad: "some content", conocimientos: "some content", contacto: "some content", correo: "some content", edad: "some content", experiencia: "some content", ideomas: "some content", image: "some content", nacionalidad: "some content", nombre: "some content", participacion: "some content", proyectos: "some content", semblaza: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Investigador.changeset(%Investigador{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Investigador.changeset(%Investigador{}, @invalid_attrs)
    refute changeset.valid?
  end
end
