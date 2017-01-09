class Product < ApplicationRecord
  belongs_to :category
  has_many :specifications, dependent: :destroy, inverse_of: :product
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :specifications, reject_if: :all_blank, allow_destroy: true
end
