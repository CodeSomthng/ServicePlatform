# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :service
  belongs_to :user
end
