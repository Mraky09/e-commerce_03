class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :address_books
  has_many :requests
  enum role: [:admin, :user]

  def role? role
    role.include? role.to_s
  end
end
