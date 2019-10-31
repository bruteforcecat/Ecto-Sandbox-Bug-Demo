defmodule EctoSandboxBugDemo.Todo do

 use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  def create_changeset(attrs) do
    required_attrs = [
      :title,
    ]

    %__MODULE__{}
    |> cast(attrs, required_attrs)
    |> validate_required(required_attrs)
  end

end
