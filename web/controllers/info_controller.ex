defmodule Prueba.InfoController do
  use Prueba.Web, :controller

  	def index(conn, _params) do
    	render conn, "index.html"
  	end

    def vision(conn, _params) do
    	render conn, "vision.html"
    end



    def mision(conn, _params) do
    	render conn, "mision.html"
    end



    def valores(conn, _params) do
    	render conn, "valores.html"
    end



    def historia(conn, _params) do
    	render conn, "historia.html"
    end

end