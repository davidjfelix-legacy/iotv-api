defmodule Api.Accounts do
  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Accounts.{Group, User}


  def change_group(%Group{} = group) do
    Group.changeset(group, %{})
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end


  def create_group(attrs \\ %{}) do
    %Group{}
    |> Group.changeset(attrs)
    |> Repo.insert()
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end


  def delete_group(%Group{} = group) do
    Repo.delete(group)
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end


  def find_group(args), do: Repo.get_by(Group, args)

  def find_user(args), do: Repo.get_by(User, args)


  def get_group(id), do: Repo.get(Group, id)

  def get_user(id), do: Repo.get(User, id)


  def list_groups do
    Repo.all(Group)
  end

  def list_users do
    Repo.all(User)
  end


  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def update_group(%Group{} = group, attrs) do
    group
    |> Group.changeset(attrs)
    |> Repo.update()
  end
end
