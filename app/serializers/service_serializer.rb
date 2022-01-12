# frozen_string_literal: true

class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :comments
end
