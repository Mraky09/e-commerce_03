class StaticPagesController < ApplicationController
  def home
    @support = Supports::StaticPageSupport.new
    @recent_viewed_products = session[:recent].map{|id| Product.find_by id: id} if
      session[:recent]
  end

  def show
    if valid_page?
      render template: "#{params[:page]}.to_s"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname
      .new Rails.root + "app/views/static_pages/#{params[:page]}.html.erb"
  end
end
