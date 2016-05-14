class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, :trackable, 
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  has_many :carts
end
