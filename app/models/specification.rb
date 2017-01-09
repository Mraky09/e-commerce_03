class Specification < ApplicationRecord
  belongs_to :product

  validates :feature_name, presence: true, length: {maximum: 100}
  validates :feature_value, presence: true, length: {maximum: 100}
end
