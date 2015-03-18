class ProjectMembershipSerializer < ActiveModel::Serializer
  attributes :id, :role
  has_many :users
  has_many :projects
end
