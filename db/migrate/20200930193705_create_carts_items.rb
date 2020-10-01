class CreateCartsItems < ActiveRecord::Migration[6.0]
  def change
    create_table :carts_items, id: false do |t| # id  этой таблицы нигде не будет использоваться, поэтому false
      t.integer :cart_id
      t.integer :item_id
    end
  end
end
