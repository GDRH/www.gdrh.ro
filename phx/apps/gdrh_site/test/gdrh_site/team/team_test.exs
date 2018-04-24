defmodule GdrhSite.TeamTest do
  use GdrhSite.DataCase

  alias GdrhSite.Team

  describe "members" do
    alias GdrhSite.Team.Member

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def member_fixture(attrs \\ %{}) do
      {:ok, member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Team.create_member()

      member
    end

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Team.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Team.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Team.create_member(@valid_attrs)
      assert member.name == "some name"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Team.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, member} = Team.update_member(member, @update_attrs)
      assert %Member{} = member
      assert member.name == "some updated name"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Team.update_member(member, @invalid_attrs)
      assert member == Team.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Team.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Team.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Team.change_member(member)
    end
  end
end
