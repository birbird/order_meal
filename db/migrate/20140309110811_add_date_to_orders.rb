class AddDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :_date, :date
  end
end
