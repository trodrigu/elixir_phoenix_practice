defmodule KeepTalking.Channels.UserSocketTest do
  use KeepTalking.ChannelCase, async: true
  alias KeepTalking.UserSocket

  test "socket authentication with valid token" do
    token = Phoenix.Token.sign(@endpoint, "user socket", "123")
    assert {:ok, socket} = connect(UserSocket, %{"token" => token})
    assert socket.assigns.user_id == "123"
  end

  test "socket authentiation with invalid token" do
    assert :error = connect(UserSocket, %{"token" => "1313"})
    assert :error = connect(UserSocket, %{"token" => "1313"})
  end
end
