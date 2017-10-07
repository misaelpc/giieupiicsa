defmodule Prueba.Repo.Migrations.CreatePublicacion do
  use Ecto.Migration

  def change do
    create table(:publicaciones) do
      add :titulo, :text
      add :resumen, :text
      add :link, :text

      timestamps()
    end

  end
end
