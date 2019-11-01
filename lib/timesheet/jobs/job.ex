defmodule Timesheet.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :code, :string
    field :description, :string
    field :hours, :integer
    field :name, :string
    field :manager_id, :id

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:hours, :description, :code, :name, :manager_id])
    |> validate_required([:hours, :description, :code, :name, :manager_id])
  end
end
