defmodule KeepTalking.AuthTest do
  use KeepTalking.ConnCase
  alias KeepTalking.Auth

  setup %{conn: conn} do
    conn =
      conn
      |> bypass_through(KeepTalking.Router, :browser)
      |> get("/")
    {:ok, %{conn: conn}}
  end

  test "authenticate_user halts when no current_user exists", %{conn: conn} do
    conn = Auth.authenticate_user(conn, [])

    assert conn.halted
  end

  test "authenticate_user continues when the current_user exists", %{conn: conn} do
    conn =
      conn
      |> assign(:current_user, %KeepTalking.User{})
      |> Auth.authenticate_user([])

    refute conn.halted
  end
end
