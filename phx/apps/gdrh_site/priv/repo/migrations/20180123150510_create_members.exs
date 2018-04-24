defmodule GdrhSite.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :name, :string
      add :facebook_id, :string
      add :github_id, :string
      add :twitter_id, :string

      timestamps()
    end

  end
end
