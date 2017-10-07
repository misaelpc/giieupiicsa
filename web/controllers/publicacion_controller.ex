defmodule Prueba.PublicacionController do
  use Prueba.Web, :controller

  alias Prueba.Publicacion

  def index(conn, _params) do
    publicaciones = Repo.all(Publicacion)
    render(conn, "index.html", publicaciones: publicaciones)
  end

  def new(conn, _params) do
    changeset = Publicacion.changeset(%Publicacion{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"publicacion" => publicacion_params}) do
    changeset = Publicacion.changeset(%Publicacion{}, publicacion_params)

    case Repo.insert(changeset) do
      {:ok, _publicacion} ->
        conn
        |> put_flash(:info, "Publicacion created successfully.")
        |> redirect(to: publicacion_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    publicacion = Repo.get!(Publicacion, id)
    render(conn, "show.html", publicacion: publicacion)
  end

  def edit(conn, %{"id" => id}) do
    publicacion = Repo.get!(Publicacion, id)
    changeset = Publicacion.changeset(publicacion)
    render(conn, "edit.html", publicacion: publicacion, changeset: changeset)
  end

  def update(conn, %{"id" => id, "publicacion" => publicacion_params}) do
    publicacion = Repo.get!(Publicacion, id)
    changeset = Publicacion.changeset(publicacion, publicacion_params)

    case Repo.update(changeset) do
      {:ok, publicacion} ->
        conn
        |> put_flash(:info, "Publicacion updated successfully.")
        |> redirect(to: publicacion_path(conn, :show, publicacion))
      {:error, changeset} ->
        render(conn, "edit.html", publicacion: publicacion, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    publicacion = Repo.get!(Publicacion, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(publicacion)

    conn
    |> put_flash(:info, "Publicacion deleted successfully.")
    |> redirect(to: publicacion_path(conn, :index))
  end
end
