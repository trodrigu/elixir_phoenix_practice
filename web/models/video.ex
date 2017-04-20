defmodule KeepTalking.Video do
  use KeepTalking.Web, :model

  @primary_key {:id, KeepTalking.Permalink, autogenerate: true}
  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    field :slug, :string
    belongs_to :user, KeepTalking.User
    belongs_to :category, KeepTalking.Category
    has_many :annotations, KeepTalking.Annotation

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :description, :category_id])
    |> sluggify_title()
    |> validate_required([:url, :title, :description])
    |> assoc_constraint(:category)
  end

  defp sluggify_title(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, sluggify(title))
    else
      changeset
    end
  end

  def sluggify(str) do
    str
    |> String.downcase
    |> String.replace(~r/[^\w-]+/u, "-")
  end
end

defimpl Phoenix.Param, for: KeepTalking.Video do
  def to_param(%{slug: slug, id: id}) do
    "#{id}-#{slug}"
  end
end
