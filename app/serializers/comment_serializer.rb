class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :service
end
