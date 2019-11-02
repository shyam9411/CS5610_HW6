defmodule TimesheetWeb.Router do
  use TimesheetWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug TimesheetWeb.Plugs.FetchCurrentManager
    plug TimesheetWeb.Plugs.FetchCurrentWorker
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimesheetWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/managers", ManagerController
    resources "/workers", WorkerController
    resources "/sessionmanager", SessionmanagerController, only: [:new, :create, :delete], singleton: true
    resources "/sessionworker", SessionworkerController, only: [:new, :create, :delete], singleton: true
    resources "/jobs", JobController, only: [:new, :create]
    resources "/tasks", TaskController, only: [:new, :create, :edit, :update]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimesheetWeb do
  #   pipe_through :api
  # end
end
