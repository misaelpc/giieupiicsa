defmodule Prueba.VinculacionView do
  use Prueba.Web, :view

  alias Prueba.Vinculacion


  def showText(%Vinculacion{descripcion: descripcion}) do
  	descripcion
  	|> String.split("@")
  end

end
