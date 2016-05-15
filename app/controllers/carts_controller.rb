class CartsController < ApplicationController
  #before_action :require_login
  def show
    @user = User.find(params[:id])

    if !@user.carts.last.line_items.empty?
      @user.current_cart = @user.carts.last
      @user.save
    end
    @current_cart = @user.current_cart
  end

  def checkout
    @user = User.find(params[:id])
    @user.current_cart = @user.carts.last
    @user.current_cart.checkout
    redirect_to cart_path(@user.carts.last)
  end
end
