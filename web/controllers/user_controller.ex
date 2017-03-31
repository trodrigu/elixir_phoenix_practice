defmodule KeepTalking.UserController do
  use KeepTalking.Web, :controller
  alias KeepTalking.User
  plug :authenticate_user when action in [:show]

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> KeepTalking.Auth.login(user)
        |> redirect(to: user_path(conn, :show, user))
        |> put_flash(:info, "#{user.name} created!")
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(KeepTalking.User, id)
    render conn, "show.html", user: user
  end
end
