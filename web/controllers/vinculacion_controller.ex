defmodule Prueba.VinculacionController do
  use Prueba.Web, :controller

  alias Prueba.Vinculacion

  def index(conn, _params) do
    vinculaciones = Repo.all(Vinculacion)
    render(conn, "index.html", vinculaciones: vinculaciones)
  end

  def new(conn, _params) do
    changeset = Vinculacion.changeset(%Vinculacion{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vinculacion" => vinculacion_params}) do
    changeset = Vinculacion.changeset(%Vinculacion{}, vinculacion_params)

    case Repo.insert(changeset) do
      {:ok, _vinculacion} ->
        conn
        |> put_flash(:info, "Vinculacion created successfully.")
        |> redirect(to: vinculacion_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vinculacion = Repo.get!(Vinculacion, id)
    render(conn, "show.html", vinculacion: vinculacion)
  end

  def edit(conn, %{"id" => id}) do
    vinculacion = Repo.get!(Vinculacion, id)
    changeset = Vinculacion.changeset(vinculacion)
    render(conn, "edit.html", vinculacion: vinculacion, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vinculacion" => vinculacion_params}) do
    vinculacion = Repo.get!(Vinculacion, id)
    changeset = Vinculacion.changeset(vinculacion, vinculacion_params)

    case Repo.update(changeset) do
      {:ok, vinculacion} ->
        conn
        |> put_flash(:info, "Vinculacion updated successfully.")
        |> redirect(to: vinculacion_path(conn, :show, vinculacion))
      {:error, changeset} ->
        render(conn, "edit.html", vinculacion: vinculacion, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vinculacion = Repo.get!(Vinculacion, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(vinculacion)

    conn
    |> put_flash(:info, "Vinculacion deleted successfully.")
    |> redirect(to: vinculacion_path(conn, :index))
  end
end
