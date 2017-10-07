defmodule Prueba.AlumnoControllerTest do
  use Prueba.ConnCase

  alias Prueba.Alumno
  @valid_attrs %{academica: "some content", actividad: "some content", conocimientos: "some content", contacto: "some content", correo: "some content", edad: "some content", experiencia: "some content", ideomas: "some content", image: "some content", nacionalidad: "some content", nombre: "some content", participacion: "some content", proyectos: "some content", semblaza: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, alumno_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing alumnos"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, alumno_path(conn, :new)
    assert html_response(conn, 200) =~ "New alumno"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, alumno_path(conn, :create), alumno: @valid_attrs
    assert redirected_to(conn) == alumno_path(conn, :index)
    assert Repo.get_by(Alumno, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, alumno_path(conn, :create), alumno: @invalid_attrs
    assert html_response(conn, 200) =~ "New alumno"
  end

  test "shows chosen resource", %{conn: conn} do
    alumno = Repo.insert! %Alumno{}
    conn = get conn, alumno_path(conn, :show, alumno)
    assert html_response(conn, 200) =~ "Show alumno"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, alumno_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    alumno = Repo.insert! %Alumno{}
    conn = get conn, alumno_path(conn, :edit, alumno)
    assert html_response(conn, 200) =~ "Edit alumno"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    alumno = Repo.insert! %Alumno{}
    conn = put conn, alumno_path(conn, :update, alumno), alumno: @valid_attrs
    assert redirected_to(conn) == alumno_path(conn, :show, alumno)
    assert Repo.get_by(Alumno, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    alumno = Repo.insert! %Alumno{}
    conn = put conn, alumno_path(conn, :update, alumno), alumno: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit alumno"
  end

  test "deletes chosen resource", %{conn: conn} do
    alumno = Repo.insert! %Alumno{}
    conn = delete conn, alumno_path(conn, :delete, alumno)
    assert redirected_to(conn) == alumno_path(conn, :index)
    refute Repo.get(Alumno, alumno.id)
  end
end
