class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :cart, through: :line_items

  def self.available_items
    Item.where('inventory > 0')
  end

end
