class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :title, :avatar, :group, :token, :projects, :tasks
  has_many :projects
  has_many :tasks
end
