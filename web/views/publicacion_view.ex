defmodule Prueba.PublicacionView do
  use Prueba.Web, :view
  alias Prueba.Publicacion

  	def parrafo(%Publicacion{resumen: ideomas}) do 
		ideomas
		|> String.split("@")
	end 
	
end
