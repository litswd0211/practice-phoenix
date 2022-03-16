defmodule Realworld.Blogs.Article do
  use Ecto.Schema
  import Ecto.Changeset
  alias Realworld.Blogs.Comment

  schema "articles" do
    field(:body, :string)
    field(:title, :string)
    has_many(:comments, Comment, on_delete: :delete_all)

    many_to_many(:tags, Tag,
      join_through: ArticleTag,
      on_replace: :delete,
      on_delete: :delete_all
    )

    timestamps()
  end

  @doc false
  def changeset(article, attrs, tags \\ []) do
    article
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
    |> put_assoc(:tags, tags)
  end

  def list_articles do
    Repo.all(Article) |> Repo.preload(:tags)
  end

  def get_article!(id) do
    Repo.get!(Article, id) |> Repo.preload(:tags)
  end
end
