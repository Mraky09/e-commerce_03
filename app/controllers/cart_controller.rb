class CartController < ApplicationController
  def index
    @cart = session[:cart] ? session[:cart] : {}
    @product_carts = @cart.map{|id, quantity| [Product.find_by(id: id), quantity]}
  end

  def create
    id = params["product_id"]
    session[:cart] = {} unless session[:cart]
    cart = session[:cart]
    cart[id] = cart[id] ? (cart[id].to_i + 1) : 1
    cart[id] = params["quantity"]
    render json: cart.size
  end

  def destroy
    session[:cart][params[:id]] = nil
    session[:cart].delete_if{|_key, value| value.blank?}
    redirect_to action: :index
  end
end
