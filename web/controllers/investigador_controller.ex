defmodule Prueba.InvestigadorController do
  use Prueba.Web, :controller

  alias Prueba.Investigador

  def index(conn, _params) do
    investigadores = Repo.all(Investigador)
    render(conn, "index.html", investigadores: investigadores)
  end

  def new(conn, _params) do
    changeset = Investigador.changeset(%Investigador{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"investigador" => investigador_params}) do
    changeset = Investigador.changeset(%Investigador{}, investigador_params)

    case Repo.insert(changeset) do
      {:ok, _investigador} ->
        conn
        |> put_flash(:info, "Investigador created successfully.")
        |> redirect(to: investigador_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    investigador = Repo.get!(Investigador, id)
    render(conn, "show.html", investigador: investigador)
  end

  def edit(conn, %{"id" => id}) do
    investigador = Repo.get!(Investigador, id)
    changeset = Investigador.changeset(investigador)
    render(conn, "edit.html", investigador: investigador, changeset: changeset)
  end

  def update(conn, %{"id" => id, "investigador" => investigador_params}) do
    investigador = Repo.get!(Investigador, id)
    changeset = Investigador.changeset(investigador, investigador_params)

    case Repo.update(changeset) do
      {:ok, investigador} ->
        conn
        |> put_flash(:info, "Investigador updated successfully.")
        |> redirect(to: investigador_path(conn, :show, investigador))
      {:error, changeset} ->
        render(conn, "edit.html", investigador: investigador, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    investigador = Repo.get!(Investigador, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(investigador)

    conn
    |> put_flash(:info, "Investigador deleted successfully.")
    |> redirect(to: investigador_path(conn, :index))
  end
end
