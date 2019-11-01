defmodule Timesheet.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :hours, :integer
      add :description, :string
      add :code, :string
      add :name, :string
      add :manager_id, references(:managers, on_delete: :nothing)

      timestamps()
    end

    create index(:jobs, [:manager_id])
  end
end
