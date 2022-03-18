defmodule Realworld.Blogs.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Realworld.Blogs.Article
  alias Realworld.Accouns.User

  schema "comments" do
    field(:body, :string)

    belongs_to(:article, Article)
    belongs_to(:author, User)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body, :article_id, :author_id])
    |> validate_required([:body, :article_id, :author_id])
  end
end
