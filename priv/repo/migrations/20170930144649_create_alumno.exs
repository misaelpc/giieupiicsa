defmodule Prueba.Repo.Migrations.CreateAlumno do
  use Ecto.Migration

  def change do
    create table(:alumnos) do
      add :nombre, :string
      add :ideomas, :text
      add :image, :string
      add :semblaza, :text
      add :nacionalidad, :string
      add :edad, :string
      add :correo, :string
      add :academica, :text
      add :actividad, :text
      add :experiencia, :text
      add :conocimientos, :text
      add :proyectos, :text
      add :participacion, :text
      add :contacto, :text

      timestamps()
    end

  end
end
