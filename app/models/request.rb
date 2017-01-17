class Request < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :accepted, :rejected]
end
