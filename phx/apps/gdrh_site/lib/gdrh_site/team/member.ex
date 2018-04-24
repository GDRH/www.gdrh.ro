defmodule GdrhSite.Team.Member do
  use Ecto.Schema
  import Ecto.Query, only: [from: 2]
  import Ecto.Changeset
  alias GdrhSite.Team.Member
  alias GdrhSite.Repo


  schema "members" do
    field :name, :string

    timestamps()
  end

  def members_list() do
    q = from m in Member, select: m 
    q 
      |> Repo.all()
      |> split_to_cols(3)
  end

  @doc false
  def changeset(%Member{} = member, attrs) do
    member
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def split_to_cols(list, nr_cols) do
    split_to_cols([[]], list, 0, nr_cols)
  end
    
  defp split_to_cols(final, [], _, _) do
    final
      |> Enum.map(&:lists.reverse/1)
      |> :lists.reverse()

    # :lists.reverse(Enum.map(final, &:lists.reverse/1))
  end
  defp split_to_cols([ row | rest], [mh|mt], nr, nr_cols) when nr<nr_cols do
    split_to_cols([[mh | row] | rest], mt, nr+1, nr_cols)
  end
  defp split_to_cols(rows, members, nr, nr_cols) when nr==nr_cols do
    split_to_cols([[] | rows], members, 0, nr_cols)
  end
end
