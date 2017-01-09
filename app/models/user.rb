class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :address_books
  enum role: [:admin, :user]

  def role? role
    role.include? role.to_s
  end
end
