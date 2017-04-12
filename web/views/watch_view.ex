defmodule KeepTalking.WatchView do
  use KeepTalking.Web, :view

  def player_id(video) do
    ~r{^.*(?:yout\.be/|\w+/|v=)(?<id>[^#&?]*)}
    |> Regex.named_captures(video.url)
    |> get_in(["id"])
  end
end
