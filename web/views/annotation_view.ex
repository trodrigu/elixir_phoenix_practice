defmodule KeepTalking.AnnotationView do
  use KeepTalking.Web, :view

  def render("annotation.json", %{annotation: ann}) do
    %{
      id: ann.id,
      body: ann.body,
      at: ann.at,
      user: render_one(ann.user, KeepTalking.UserView, "user.json")
    }
  end
end
