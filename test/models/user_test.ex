defmodule KeepTalking.UserModelTest do
  use KeepTalking.ModelCase
  alias KeepTalking.User

  describe "User.registration changeset/2" do
    test "with confirmation that does not match" do
      changeset = User.registration_changeset(%User{}, %{password: "foo", password_confirmation: "bar"})
      refute changeset.valid?
    end

    test "with valid parameters" do
      changeset = User.registration_changeset(%User{}, %{password: "pizzapie", password_confirmation: "pizzapie"})
      assert changeset.valid?
    end
  end

  describe "User.changeset/2" do
    test "with username length under 1 characters" do
      changeset = User.changeset(%User{}, %{name: "Tommy", username: "t"})
      refute changeset.valid?
    end

    test "with length over 20 characters" do
      changeset = User.changeset(%User{}, %{name: "Tommy", username: "trodtrodtrodtrodtrodtrod"})
      refute changeset.valid?
    end

    test "with valid params" do
      changeset = User.changeset(%User{}, %{name: "Tommy", username: "trod1991"})
      assert changeset.valid?
    end
  end
end
