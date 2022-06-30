defmodule KeepTalking.Router do
  use KeepTalking.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug KeepTalking.Auth, repo: KeepTalking.Repo
  end

  pipeline :api do
    plug :accepts, ["json-api", "json"]
    plug JaSerializer.Deserializer
  end

  pipeline :bearer_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", KeepTalking do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/user/profile", UserController, :show
    resources "/users", UserController, only: [:new, :create, :show]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/watch/:id", WatchController, :show
  end

  scope "/manage", KeepTalking do
    pipe_through [:browser, :authenticate_user]
    resources "/videos", VideoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", KeepTalking do
  #   pipe_through :api
  # end
end
