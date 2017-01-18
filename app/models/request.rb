class Request < ApplicationRecord
  belongs_to :user
  before_create :set_status_request

  enum status: [:pending, :accepted, :rejected]

  private
  def set_status_request
    self[:status] = :pending
  end
end
