module ApplicationHelper
  def full_title page_title = ""
    base_title = "E-Commerce"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def add_fields name, f, association
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for association, new_object, child_index: id do |builder|
      render association.to_s.singularize + "_fields", f: builder
    end
    link_to name, "#", class: "add_fields",
      data: {id: id, fields: fields.delete("\n")}
  end

  def create_index object, index, per_page
    (object.to_i - 1) * per_page + index + 1
  end

  def calc_price_of_order_detail product, quantity
    product.price * quantity.to_i
  end

  def load_categories_menu
    @tree = ""
    tree Category.all
  end

  def tree categories, lft = 0, rgt = nil, depth = -1
    @tree += "<ul class='dropdown-menu'>" if lft.zero? && rgt.nil? &&
                                             depth == -1
    categories.each do |category|
      if category.left > lft && (rgt.nil? || category.left <
        rgt) && category.depth == depth + 1
        categories_temp = categories.compact
        categories_temp.delete category
        @tree += "<li class='dropdown-submenu '>
          <a href='/categories/#{category.id}'>#{category.name}</a>"
        if category.right != (category.left + 1)
          @tree += "<ul class='dropdown-menu' >"
          tree categories_temp, category.left, category.right, category.depth
          @tree += "</ul>"
        end
        @tree += "</li>"
      end
    end
    @tree += "</ul>" if lft.zero? & rgt.nil? && depth == -1
    @tree
  end
end
