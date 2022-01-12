# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :service
end
