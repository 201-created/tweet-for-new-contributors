defmodule Twitterbot.Issue do
  use Ecto.Schema
  import Ecto.Changeset


  schema "issues" do
    field :github_id, :integer
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [:github_id, :title, :url])
    |> validate_required([:github_id, :title, :url])
  end
end
