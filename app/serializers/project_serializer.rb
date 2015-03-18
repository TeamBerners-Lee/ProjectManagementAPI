class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date, :privacy, :tasks, :user
  has_many :tasks
end
