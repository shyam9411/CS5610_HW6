defmodule Timesheet.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :hours, :integer
    field :status, :boolean, default: false
    field :job_id, :id
    field :worker_id, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:status, :hours, :description, :job_id, :worker_id])
    |> validate_required([:status, :hours, :description, :job_id, :worker_id])
    |> validate_inclusion(:hours, 1..8)
  end
end
