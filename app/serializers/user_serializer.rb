class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :title, :avatar, :token, :projects, :tasks
  has_many :projects
  has_many :tasks
end
