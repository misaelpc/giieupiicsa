defmodule Prueba.VinculacionControllerTest do
  use Prueba.ConnCase

  alias Prueba.Vinculacion
  @valid_attrs %{descripcion: "some content", image: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, vinculacion_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing vinculaciones"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, vinculacion_path(conn, :new)
    assert html_response(conn, 200) =~ "New vinculacion"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, vinculacion_path(conn, :create), vinculacion: @valid_attrs
    assert redirected_to(conn) == vinculacion_path(conn, :index)
    assert Repo.get_by(Vinculacion, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, vinculacion_path(conn, :create), vinculacion: @invalid_attrs
    assert html_response(conn, 200) =~ "New vinculacion"
  end

  test "shows chosen resource", %{conn: conn} do
    vinculacion = Repo.insert! %Vinculacion{}
    conn = get conn, vinculacion_path(conn, :show, vinculacion)
    assert html_response(conn, 200) =~ "Show vinculacion"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, vinculacion_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    vinculacion = Repo.insert! %Vinculacion{}
    conn = get conn, vinculacion_path(conn, :edit, vinculacion)
    assert html_response(conn, 200) =~ "Edit vinculacion"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    vinculacion = Repo.insert! %Vinculacion{}
    conn = put conn, vinculacion_path(conn, :update, vinculacion), vinculacion: @valid_attrs
    assert redirected_to(conn) == vinculacion_path(conn, :show, vinculacion)
    assert Repo.get_by(Vinculacion, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    vinculacion = Repo.insert! %Vinculacion{}
    conn = put conn, vinculacion_path(conn, :update, vinculacion), vinculacion: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit vinculacion"
  end

  test "deletes chosen resource", %{conn: conn} do
    vinculacion = Repo.insert! %Vinculacion{}
    conn = delete conn, vinculacion_path(conn, :delete, vinculacion)
    assert redirected_to(conn) == vinculacion_path(conn, :index)
    refute Repo.get(Vinculacion, vinculacion.id)
  end
end
