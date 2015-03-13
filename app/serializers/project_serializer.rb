class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date, :privacy, :user, :tasks
  belongs_to :user
  has_many :tasks
end
