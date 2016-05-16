class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, :trackable, 
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :current_cart
  devise :database_authenticatable, :registerable, :validatable
  has_many :carts

  def current_cart
    @cart = self.carts.last
    if @cart.try(:status) == 'pending'
      @cart
    else
      nil
    end
  end
end
