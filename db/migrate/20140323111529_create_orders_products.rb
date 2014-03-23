class CreateOrdersProducts < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
      t.references :order, index: true
      t.references :product, index: true
    end
  end
end
