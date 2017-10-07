defmodule Prueba.PublicacionControllerTest do
  use Prueba.ConnCase

  alias Prueba.Publicacion
  @valid_attrs %{link: "some content", resumen: "some content", titulo: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, publicacion_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing publicaciones"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, publicacion_path(conn, :new)
    assert html_response(conn, 200) =~ "New publicacion"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, publicacion_path(conn, :create), publicacion: @valid_attrs
    assert redirected_to(conn) == publicacion_path(conn, :index)
    assert Repo.get_by(Publicacion, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, publicacion_path(conn, :create), publicacion: @invalid_attrs
    assert html_response(conn, 200) =~ "New publicacion"
  end

  test "shows chosen resource", %{conn: conn} do
    publicacion = Repo.insert! %Publicacion{}
    conn = get conn, publicacion_path(conn, :show, publicacion)
    assert html_response(conn, 200) =~ "Show publicacion"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, publicacion_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    publicacion = Repo.insert! %Publicacion{}
    conn = get conn, publicacion_path(conn, :edit, publicacion)
    assert html_response(conn, 200) =~ "Edit publicacion"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    publicacion = Repo.insert! %Publicacion{}
    conn = put conn, publicacion_path(conn, :update, publicacion), publicacion: @valid_attrs
    assert redirected_to(conn) == publicacion_path(conn, :show, publicacion)
    assert Repo.get_by(Publicacion, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    publicacion = Repo.insert! %Publicacion{}
    conn = put conn, publicacion_path(conn, :update, publicacion), publicacion: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit publicacion"
  end

  test "deletes chosen resource", %{conn: conn} do
    publicacion = Repo.insert! %Publicacion{}
    conn = delete conn, publicacion_path(conn, :delete, publicacion)
    assert redirected_to(conn) == publicacion_path(conn, :index)
    refute Repo.get(Publicacion, publicacion.id)
  end
end
