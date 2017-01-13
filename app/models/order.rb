class Order < ApplicationRecord
  belongs_to :user

  enum status: [:buying, :ordered, :progressing, :shipping, :delivered]
end
