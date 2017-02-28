defmodule KeepTalking.PageController do
  use KeepTalking.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
