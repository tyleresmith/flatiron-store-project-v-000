class CartsController < ApplicationController
  #before_action :require_login
  def show
    @user = User.find(params[:id])
    @user.current_cart = @user.carts.last
    @current_cart = @user.current_cart 
  end

  def checkout
    @user = User.find(params[:id])
    @current_cart = @user.current_cart 
    @current_cart.checkout
    @current_cart = nil
    redirect_to @user.carts.last
  end
end
