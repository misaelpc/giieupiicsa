defmodule Prueba.Publicacion do
  use Prueba.Web, :model

  schema "publicaciones" do
    field :titulo, :string
    field :resumen, :string
    field :link, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:titulo, :resumen, :link])
    |> validate_required([:titulo, :resumen, :link])
  end
end
