defmodule KeepTalking.HelloController do
  use KeepTalking.Web, :controller

  def hello(conn, _params) do
    render conn, "hello.html"
  end
end
