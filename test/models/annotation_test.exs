defmodule KeepTalking.AnnotationTest do
  use KeepTalking.ModelCase

  alias KeepTalking.Annotation

  @valid_attrs %{at: 42, body: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Annotation.changeset(%Annotation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Annotation.changeset(%Annotation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
