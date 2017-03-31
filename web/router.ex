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
    plug :accepts, ["json"]
  end

  scope "/", KeepTalking do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create, :show]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
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
