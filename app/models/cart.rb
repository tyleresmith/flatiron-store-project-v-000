class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.items.each do |item|
      total += item.price
    end
    total
  end

  def add_item(item_id)
    item = Item.find_by_id(item_id)
    li = LineItem.new(cart_id: self.id, item_id: item_id)
    existing_li = LineItem.find_by(cart_id: self.id, item_id: item_id)

    if existing_li
      existing_li.quantity += 1
      existing_li
    else
      li
    end
  end

  def checkout
    self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    self.line_items.destroy_all
    self.user.current_cart = nil
    self.user.save
  end


end
