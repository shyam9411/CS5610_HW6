# Timesheet

This Repository contains the Timesheet application for two user groups namely managers and workers.

- Worker gets to upload the timesheet by tagging a timesheet with a job id. Each job id is maintained by the manager and then a manager would approve of such requests.
- The Manager table and the Worker table consists of user name, email and password hash The password is hashed using Argon2 module to ensure that password as a plain text is never leaked over the wire. It ensure security for user credentials.
- The seeds.exs file includes a couple of manager, worker, Jobs, records for easing the testing of the timesheet app.
- A worker can log anytime within 1 - 8 hours and anything above or below is considered invalid. Appropriate error logs would be displayed on the screen.
- 4 tables were identified in the due process. These include: Managers, Workers, Jobs and Tasks.
- The manager has the priviledge to approve or choose to ignore a timesheet record.
- A worker can submit 8 timesheet requests in total. This includes approved requests as well.
- The Tasks table in the timesheet table consists of the number of hours clocked by the worker, the job code with which this task is associated with, the status which tells if the timesheet is approved or not, the worker id who is filing the timesheet record and any additional notes that is required for the timesheet record.
- The Jobs table consists of job code, number of hours spent on the job, the name of the job, its description and the manager who will be approving the timesheet records associated to the particular job. The reference to manager is done using the foreign key relation were managers id is associated with the job.