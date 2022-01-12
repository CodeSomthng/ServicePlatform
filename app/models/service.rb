# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :comments, dependent: :destroy
end
