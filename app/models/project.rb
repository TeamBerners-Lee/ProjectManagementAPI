class Project < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :tasks
end
