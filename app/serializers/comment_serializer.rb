class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :task, :user

  def created_at
    object.created_at.strftime('%m-%d-%y')
  end
end
