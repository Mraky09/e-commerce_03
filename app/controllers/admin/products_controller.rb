class Admin::ProductsController < ApplicationController
  before_action :is_admin?

  def index
    @products = Product.select("id", "name", "price", "category_id").includes(:category)
  end

  def new
    @categories = Category.select("id", "name", "depth")
    @product = Product.new
    respond_to do |format|
      format.html{render partial: "product_form", local: {product: @product}}
    end
  end

  def create
    @product = Product.create product_params
    respond_to do |format|
      if @product.save
        format.html{render @product}
      else
        render json: {errors: @product.errors.full_messages}
      end
    end
  end

  private
  def product_params
    params.required(:product).permit :name, :quantity, :category_id, :description,
      :price, :image, specifications_attributes: [:id, :feature_name,
      :feature_value, :_destroy]
  end
end
