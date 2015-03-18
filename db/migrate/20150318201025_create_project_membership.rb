class CreateProjectMembership < ActiveRecord::Migration
  def change
    create_table :project_memberships do |t|
      t.string :role
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
    end
    add_foreign_key :project_memberships, :users
    add_foreign_key :project_memberships, :projects
  end
end
