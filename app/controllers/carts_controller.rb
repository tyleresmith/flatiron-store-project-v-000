class CartsController < ApplicationController
  def show
    @user = current_user
    set_current_cart
  end

  def checkout
    @user = current_user
    set_current_cart
    current_cart.checkout
    
    # binding.pry
    redirect_to @cart
  end

  private

  def current_cart
    @cart = current_user.current_cart

  end

  def set_current_cart
    if current_user.carts.last.status == 'pending' 
      current_user.current_cart = @user.carts.last
      current_user.save
      current_cart
    elsif current_cart.nil?
      @cart = Cart.new
    else
      current_cart
    end
  end 
end
