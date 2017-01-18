class CategoriesController < ApplicationController
  load_and_authorize_resource

  def show
    @search = @category.products.search params[:q]
    @products = @search.result.page(params[:page])
      .per Settings.category.display_product.per_page
  end
end
