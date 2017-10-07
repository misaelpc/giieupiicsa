defmodule Prueba.AlumnoView do
  use Prueba.Web, :view
  alias Prueba.Alumno

  	def languages(%Alumno{ideomas: ideomas}) do 
		ideomas
		|> String.split(".")
	end 
	
end
