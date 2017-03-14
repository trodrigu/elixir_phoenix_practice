defmodule KeepTalking.UserView do
  use KeepTalking.Web, :view
  alias KeepTalking.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
