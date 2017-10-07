defmodule Prueba.Alumno do
  use Prueba.Web, :model
  use Arc.Ecto.Schema

  schema "alumnos" do
    field :nombre, :string
    field :ideomas, :string
    field :image, Prueba.ImageUploader.Type
    field :semblaza, :string
    field :nacionalidad, :string
    field :edad, :string
    field :correo, :string
    field :academica, :string
    field :actividad, :string
    field :experiencia, :string
    field :conocimientos, :string
    field :proyectos, :string
    field :participacion, :string
    field :contacto, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombre, :ideomas, :semblaza, :nacionalidad, :edad, :correo, :academica, :actividad, :experiencia, :conocimientos, :proyectos, :participacion, :contacto])
    |> cast_attachments(params, [:image])
    |> validate_required([:nombre, :ideomas,:image, :semblaza, :nacionalidad, :edad, :correo, :academica, :actividad, :experiencia, :conocimientos, :proyectos, :participacion, :contacto])
  end
  
end
