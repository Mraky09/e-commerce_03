class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true, uniqueness: true, length: {maximum: 150}

  def update_category id
    current_max_right = max_right
    if id.empty?
      current_max_right.nil? ? update(left: 1, right: 2, depth: 0)
        : update(left: current_max_right + 1, right: current_max_right + 2, depth: 0)
    else
      parent = Category.find_by id: id
      Category.where("right >= ?", parent.right).update_all "right = right + 2"
      Category.where("left >= ?", parent.right).update_all "left = left + 2"
      update left: parent.right, right: parent.right + 1, depth: parent.depth + 1
    end
  end

  def leaf?
    right == left + 1
  end

  def delete_category
    Category.where("right >= ?", right).update_all "right = right - 2"
    Category.where("left >= ?", right).update_all "left = left - 2"
  end

  private
  def max_right
    Category.maximum :right
  end
end
