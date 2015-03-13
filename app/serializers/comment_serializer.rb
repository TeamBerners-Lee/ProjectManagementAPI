class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :task

  def created_at
    object.created_at.strftime('%m-%d-%y')
  end
end
