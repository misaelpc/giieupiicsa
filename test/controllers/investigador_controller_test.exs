defmodule Prueba.InvestigadorControllerTest do
  use Prueba.ConnCase

  alias Prueba.Investigador
  @valid_attrs %{academica: "some content", actividad: "some content", conocimientos: "some content", contacto: "some content", correo: "some content", edad: "some content", experiencia: "some content", ideomas: "some content", image: "some content", nacionalidad: "some content", nombre: "some content", participacion: "some content", proyectos: "some content", semblaza: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, investigador_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing investigadores"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, investigador_path(conn, :new)
    assert html_response(conn, 200) =~ "New investigador"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, investigador_path(conn, :create), investigador: @valid_attrs
    assert redirected_to(conn) == investigador_path(conn, :index)
    assert Repo.get_by(Investigador, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, investigador_path(conn, :create), investigador: @invalid_attrs
    assert html_response(conn, 200) =~ "New investigador"
  end

  test "shows chosen resource", %{conn: conn} do
    investigador = Repo.insert! %Investigador{}
    conn = get conn, investigador_path(conn, :show, investigador)
    assert html_response(conn, 200) =~ "Show investigador"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, investigador_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    investigador = Repo.insert! %Investigador{}
    conn = get conn, investigador_path(conn, :edit, investigador)
    assert html_response(conn, 200) =~ "Edit investigador"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    investigador = Repo.insert! %Investigador{}
    conn = put conn, investigador_path(conn, :update, investigador), investigador: @valid_attrs
    assert redirected_to(conn) == investigador_path(conn, :show, investigador)
    assert Repo.get_by(Investigador, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    investigador = Repo.insert! %Investigador{}
    conn = put conn, investigador_path(conn, :update, investigador), investigador: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit investigador"
  end

  test "deletes chosen resource", %{conn: conn} do
    investigador = Repo.insert! %Investigador{}
    conn = delete conn, investigador_path(conn, :delete, investigador)
    assert redirected_to(conn) == investigador_path(conn, :index)
    refute Repo.get(Investigador, investigador.id)
  end
end
