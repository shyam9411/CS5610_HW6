defmodule Timesheet.Workers.Worker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workers" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :manager_id, :id

    timestamps()
  end

  @doc false
  def changeset(worker, attrs) do
    worker
    |> cast(attrs, [:email, :name, :password_hash])
    |> validate_required([:email, :name, :password_hash])
  end
end
