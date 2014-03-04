class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :customer_address
      t.string :customer_mobile
      t.references :product, index: true
      t.string :delivery_man
      t.boolean :is_complete
      t.text :note

      t.timestamps
    end
  end
end
