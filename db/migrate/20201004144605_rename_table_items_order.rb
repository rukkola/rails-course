class RenameTableItemsOrder < ActiveRecord::Migration[6.0]
  rename_table :items_order, :items_orders
end
