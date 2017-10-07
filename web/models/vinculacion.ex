defmodule Prueba.Vinculacion do
  use Prueba.Web, :model
  use Arc.Ecto.Schema

  schema "vinculaciones" do
    field :image, Prueba.ImageUploader.Type
    field :descripcion, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:descripcion])
    |> cast_attachments(params, [:image])
    |> validate_required([:image, :descripcion])
  end
end
