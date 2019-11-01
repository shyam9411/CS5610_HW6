defmodule TimesheetWeb.ManagerController do
  use TimesheetWeb, :controller

  alias Timesheet.Managers
  alias Timesheet.Managers.Manager
  alias Timesheet.Tasks
  alias Timesheet.Tasks.Task
  alias Timesheet.Jobs
  alias Timesheet.Jobs.Job

  def index(conn, _params) do
    managers = Managers.list_managers()
    tasks = Tasks.list_tasks()
    jobs = Jobs.list_jobs()
    filtered_jobs = Enum.filter(jobs, fn x -> x.manager_id == conn.assigns[:current_user].id end)
    filtered_tasks = Enum.filter(tasks, fn x -> Enum.find(filtered_jobs, fn y -> y.id == x.job_id end) != :nil end)
    render(conn, "index.html", managers: managers, tasks: filtered_tasks)
    
  end

  def new(conn, _params) do
    changeset = Managers.change_manager(%Manager{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"manager" => manager_params}) do
    case Managers.create_manager(manager_params) do
      {:ok, manager} ->
        conn
        |> put_flash(:info, "Manager created successfully.")
        |> redirect(to: Routes.manager_path(conn, :show, manager))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    manager = Managers.get_manager!(id)
    tasks = Tasks.list_tasks()
    jobs = Jobs.list_jobs()
    filtered_jobs = Enum.filter(jobs, fn x -> x.manager_id == manager.id end)
    filtered_tasks = Enum.filter(tasks, fn x -> Enum.find(filtered_jobs, fn y -> y.id == x.job_id end) != :nil end)
    render(conn, "show.html", manager: manager)
  end

  def edit(conn, %{"id" => id}) do
    manager = Managers.get_manager!(id)
    changeset = Managers.change_manager(manager)
    render(conn, "edit.html", manager: manager, changeset: changeset)
  end

  def update(conn, %{"id" => id, "manager" => manager_params}) do
    manager = Managers.get_manager!(id)

    case Managers.update_manager(manager, manager_params) do
      {:ok, manager} ->
        conn
        |> put_flash(:info, "Manager updated successfully.")
        |> redirect(to: Routes.manager_path(conn, :show, manager))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", manager: manager, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    manager = Managers.get_manager!(id)
    {:ok, _manager} = Managers.delete_manager(manager)

    conn
    |> put_flash(:info, "Manager deleted successfully.")
    |> redirect(to: Routes.manager_path(conn, :index))
  end
end
