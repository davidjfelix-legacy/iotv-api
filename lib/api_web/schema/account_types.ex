defmodule ApiWeb.Schema.AccountTypes do
    use Absinthe.Schema.Notation

    object :user do
        field :id, :id
        field :email, :string
        field :real_name, :string
        field :user_name, :string
    end

    object :group do
        field :id, :id
    end
end