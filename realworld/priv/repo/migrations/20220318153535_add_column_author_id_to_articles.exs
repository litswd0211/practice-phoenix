defmodule Realworld.Repo.Migrations.AddColumnAuthorIdToArticles do
  use Ecto.Migration

  def change do
    alter table("articles") do
      add(:author_id, references(:users, on_delete: :nothing))
    end

    creare(index(:articles, [:author_id]))
  end
end
