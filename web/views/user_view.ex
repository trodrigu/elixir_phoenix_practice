defmodule KeepTalking.UserView do
  use KeepTalking.Web, :view
  alias KeepTalking.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username}
  end
end
