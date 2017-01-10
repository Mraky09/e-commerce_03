class Supports::StaticPageSupport
  def root_categories
    @categories = Category.where("depth = 0")
  end

  def hot_products
    @hot_products = Product.hot_trend.take Settings.home.display_product
  end

  def new_products
    @new_products = Product.order(created_at: :desc)
      .take Settings.home.display_product
  end
end
