class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable, :omniauthable
  has_many :address_books
  has_many :requests
  has_many :orders
  has_many :comments

  enum role: [:admin, :user]

  before_save :set_default_role

  ratyrate_rater

  scope :email_of_all_admins, -> (){select(:id, :email).where role: :admin}

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.save
      end
    end
  end

  def is_admin_user?
    role == "admin"
  end

  private
  def set_default_role
    self.role ||= :user
  end
end
