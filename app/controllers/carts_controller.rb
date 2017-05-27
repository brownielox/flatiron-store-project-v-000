class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    if logged_in?
      @cart = Cart.find_by(id: params[:id])
      @cart.checkout
      @cart.user.save
      redirect_to cart_path(@cart)
    end
    @cart.user.current_cart = nil
  end
end
