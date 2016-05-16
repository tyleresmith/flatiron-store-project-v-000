class LineItemsController < ApplicationController



  def create
    if !current_user.current_cart.nil?
      @cart = current_user.carts.last
    else 
      @cart = current_user.carts.create
    end
    @cart.add_item(params[:item_id]).save
    redirect_to @cart
  end
end
