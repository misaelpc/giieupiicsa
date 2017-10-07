defmodule Prueba.AlumnoController do
  use Prueba.Web, :controller

  alias Prueba.Alumno

  def index(conn, _params) do
    alumnos = Repo.all(Alumno)
    render(conn, "index.html", alumnos: alumnos)
  end

  def new(conn, _params) do
    changeset = Alumno.changeset(%Alumno{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"alumno" => alumno_params}) do
    changeset = Alumno.changeset(%Alumno{}, alumno_params)

    case Repo.insert(changeset) do
      {:ok, _alumno} ->
        conn
        |> put_flash(:info, "Alumno created successfully.")
        |> redirect(to: alumno_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    alumno = Repo.get!(Alumno, id)
    render(conn, "show.html", alumno: alumno)
  end

  def edit(conn, %{"id" => id}) do
    alumno = Repo.get!(Alumno, id)
    changeset = Alumno.changeset(alumno)
    render(conn, "edit.html", alumno: alumno, changeset: changeset)
  end

  def update(conn, %{"id" => id, "alumno" => alumno_params}) do
    alumno = Repo.get!(Alumno, id)
    changeset = Alumno.changeset(alumno, alumno_params)

    case Repo.update(changeset) do
      {:ok, alumno} ->
        conn
        |> put_flash(:info, "Alumno updated successfully.")
        |> redirect(to: alumno_path(conn, :show, alumno))
      {:error, changeset} ->
        render(conn, "edit.html", alumno: alumno, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    alumno = Repo.get!(Alumno, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(alumno)

    conn
    |> put_flash(:info, "Alumno deleted successfully.")
    |> redirect(to: alumno_path(conn, :index))
  end
end
