class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.includes(:products).order :left
  end

  def create
    @category = Category.new category_params
    respond_to do |format|
      if @category.update_category params[:parent_id]
        format.html{render @category}
      else
        format.html
      end
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end
end
