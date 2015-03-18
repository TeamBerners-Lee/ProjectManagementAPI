class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date, :privacy, :tasks, :users
  has_many :tasks
end
