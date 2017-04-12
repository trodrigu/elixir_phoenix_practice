defmodule KeepTalking.WatchController do
  use KeepTalking.Web, :controller
  alias KeepTalking.Vdieo

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end
