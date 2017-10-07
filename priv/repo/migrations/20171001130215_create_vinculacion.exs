defmodule Prueba.Repo.Migrations.CreateVinculacion do
  use Ecto.Migration

  def change do
    create table(:vinculaciones) do
      add :image, :string
      add :descripcion, :text

      timestamps()
    end

  end
end
