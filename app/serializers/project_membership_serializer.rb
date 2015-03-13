class ProjectMembershipSerializer < ActiveModel::Serializer
  attributes :id, :role, :users, :projects
  has_many :users
  has_many :projects
end
