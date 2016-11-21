defmodule UserRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.User

  @valid_attrs %{name: "A User", username: "Eva"}

  test "converts uniqe_constraint on username to error" do
    insert_user(username: "igglepiggle")
    attrs = Map.put(@valid_attrs, :username, "igglepiggle")
    changeset = User.changeset(%User{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert {:username, {"has already been taken", []}} in changeset.errors
  end

end
