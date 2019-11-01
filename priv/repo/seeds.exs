# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheet.Repo.insert!(%Timesheet.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Timesheet.Repo
alias Timesheet.Managers.Manager
alias Timesheet.Workers.Worker
alias Timesheet.Jobs.Job
alias Timesheet.Tasks.Task

pass = Argon2.hash_pwd_salt("password")
Repo.insert!(%Manager{name: "mgr1", email: "mgr1@test.com", password_hash: pass})
Repo.insert!(%Manager{name: "mgr2", email: "mgr2@test.com", password_hash: pass})

Repo.insert!(%Worker{name: "worker1", email: "worker1@test.com", password_hash: pass})
Repo.insert!(%Worker{name: "worker2", email: "worker2@test.com", password_hash: pass})

Repo.insert!(%Job{hours: 1, description: "random description", code: "111", manager_id: 1, name: "random name"})
Repo.insert!(%Job{hours: 2, description: "random description 2", code: "555", manager_id: 2, name: "random name"})

Repo.insert!(%Task{status: true, hours: 1, description: "random desc", job_id: 1, worker_id: 1})
Repo.insert!(%Task{status: false, hours: 2, description: "random desc 2", job_id: 2, worker_id: 2})