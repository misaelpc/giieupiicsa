defmodule Prueba.Router do
  use Prueba.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Prueba do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    
    get "/quienesomos", InfoController, :index
    get "/quienesomos/vision", InfoController, :vision
    get "/quienesomos/mision", InfoController, :mision
    get "/quienesomos/valores", InfoController, :valores
    get "/quienesomos/historia", InfoController, :historia
    resources "/investigadores", InvestigadorController
    resources "/alumnos", AlumnoController
    resources "/vinculaciones", VinculacionController
    resources "/publicaciones", PublicacionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Prueba do
  #   pipe_through :api
  # end
end
