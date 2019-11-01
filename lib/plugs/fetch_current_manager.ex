defmodule TimesheetWeb.Plugs.FetchCurrentManager do
    import Plug.Conn
  
    def init(args), do: args
  
    def call(conn, _args) do
      user = Timesheet.Managers.get_manager(get_session(conn, :user_id) || -1)
      if user do
        assign(conn, :current_user, user)
      else
        assign(conn, :current_user, nil)
      end
    end
  end