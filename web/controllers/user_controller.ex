defmodule KeepTalking.UserController do
  use KeepTalking.Web, :controller
  alias KeepTalking.User
  plug :authenticate when action in [:show]

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
        render(conn, "new.html", changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(KeepTalking.User, id)
    render conn, "show.html", user: user
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page!")
      |> redirect(to: page_path(conn, :index))
      |> halt
    end
  end
end
