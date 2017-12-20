defmodule ApiWeb.Schema.VideoContainerTypes do
    use Absinthe.Schema.Notation

    object :performance do
        field :id, :id
    end

    object :playlist do
       field :id, :id 
    end

    object :series do
        field :id, :id
    end

end