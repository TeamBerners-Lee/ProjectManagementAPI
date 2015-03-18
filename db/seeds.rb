ProjectMembership.destroy_all
Task.destroy_all
User.destroy_all
Project.destroy_all

users = User.create!([
  {username: 'Annie', email: 'annie@ga.co', password_digest: 'yah', title: 'web developer', token: 'insert_token_here'},
  {username: 'Kelly', email: 'kelly@ga.co', password_digest: 'yah', title: 'web developer', token: 'insert_token_here'},
  {username: 'Pat', email: 'pat@ga.co', password_digest: 'yah', title: 'web developer', token: 'insert_token_here'},
  {username: 'eCommercer Person', email: 'ec@ga.co', password_digest: 'yah', title: 'web developer', token: 'insert_token_here'},
  {username: 'Dating Person', email: 'd@ga.co', password_digest: 'yah', title: 'web developer', token: 'insert_token_here'},
  ])

# project_memberships = ProjectMembership.create!([{role: 'admin'},{role: 'developer'},{role: 'client'}])

projects = Project.create!([
  {name: "Project Management App",description: "Create an app for users to be more organized when they create their projects", due_date: DateTime.new(2015,3,19,9), privacy: false},
  {name: "eCommerce App", description: "Create an app to make payments online", due_date: DateTime.new(2015,3,19,9), privacy: false},
  {name: "Dating App", description: "Create a dating web app", due_date: DateTime.new(2015,3,19,9), privacy: false}
  ])

project_tasks = Task.create!([
  {name: "create back end", due_date: DateTime.new(2015,3,17,9), status: "staged", priority: "high", order: 1, privacy: false},
  {name: "create back end", due_date: DateTime.new(2015,3,17,9), status: "in progress", priority: "medium", order: 2, privacy: false},
  {name: "create back end", due_date: DateTime.new(2015,3,17,9), status: "completed", priority: "low", order: 3, privacy: false}
  ])

projects[0].tasks << project_tasks[0]
projects[1].tasks << project_tasks[1]
projects[2].tasks << project_tasks[2]

users[0].tasks << project_tasks[0]
users[3].tasks << project_tasks[1]
users[4].tasks << project_tasks[2]

task_comments = Comment.create!([
  {body: "I <3 project management!"},
  {body: "I <3 project eCommerce!"},
  {body: "I <3 project dating!"}
  ])

users[0].comments << task_comments[0]
users[1].comments << task_comments[0]
users[2].comments << task_comments[0]
users[3].comments << task_comments[1]
users[4].comments << task_comments[2]

project_tasks[0].comments << task_comments[0]
project_tasks[1].comments << task_comments[1]
project_tasks[2].comments << task_comments[2]



ProjectMembership.create!({role: 'admin', user_id: users[0].id, project_id: projects[0].id})
ProjectMembership.create!({role: 'developer', user_id: users[1].id, project_id: projects[0].id})
ProjectMembership.create!({role: 'developer', user_id: users[2].id, project_id: projects[0].id})
ProjectMembership.create!({role: 'client', user_id: users[4].id, project_id: projects[0].id})


ProjectMembership.create!({role: 'admin', user_id: users[2].id, project_id: projects[1].id})
ProjectMembership.create!({role: 'developer', user_id: users[4].id, project_id: projects[1].id})
ProjectMembership.create!({role: 'developer', user_id: users[1].id, project_id: projects[1].id})
ProjectMembership.create!({role: 'client', user_id: users[3].id, project_id: projects[1].id})


ProjectMembership.create!({role: 'admin', user_id: users[4].id, project_id: projects[2].id})
ProjectMembership.create!({role: 'developer', user_id: users[1].id, project_id: projects[2].id})
ProjectMembership.create!({role: 'developer', user_id: users[3].id, project_id: projects[2].id})
ProjectMembership.create!({role: 'client', user_id: users[2].id, project_id: projects[2].id})
