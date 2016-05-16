class AddCurrentCartToUser < ActiveRecord::Migration
  def change
    def change
      add_column :users, :current_cart, :integer, default: nil
    end
  end
end
