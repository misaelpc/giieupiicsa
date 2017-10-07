defmodule Prueba.Repo.Migrations.CreateInvestigador do
  use Ecto.Migration

  def change do
    create table(:investigadores) do
      add :nombre, :string
      add :ideomas, :text
      add :image, :string
      add :semblaza, :string
      add :nacionalidad, :string
      add :edad, :string
      add :correo, :string
      add :academica, :text
      add :actividad, :text
      add :experiencia, :string
      add :conocimientos, :string
      add :proyectos, :text
      add :participacion, :text
      add :contacto, :text

      timestamps()
    end

  end
end
