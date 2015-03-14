class Comment < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  # validates :body, :presence => true
  # will add this later with the rest of the validations
end
