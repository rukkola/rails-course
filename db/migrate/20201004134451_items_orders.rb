class ItemsOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :items_order, id: false do |t|
      t.belongs_to :item
      t.belongs_to :order
    end
  end
end
