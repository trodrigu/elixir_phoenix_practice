defmodule KeepTalking.Annotation do
  use KeepTalking.Web, :model

  schema "annotations" do
    field :body, :string
    field :at, :integer
    belongs_to :user, KeepTalking.User
    belongs_to :video, KeepTalking.Video

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :at])
    |> validate_required([:body, :at])
  end
end
