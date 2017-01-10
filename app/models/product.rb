class Product < ApplicationRecord
  belongs_to :category
  has_many :specifications, dependent: :destroy, inverse_of: :product
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :specifications, reject_if: :all_blank,
    allow_destroy: true

  class << self
    def hot_trend
      date = Time.now - Settings.hot_trend.day
      product_ids = "SELECT order_details.product_id FROM order_details
        WHERE (date(order_details.created_at) > '#{date}')
        GROUP BY order_details.product_id
        ORDER BY SUM(order_details.quantity)"
      Product.where("id IN (#{product_ids})")
    end
  end
end
