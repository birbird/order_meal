class CreateQuota < ActiveRecord::Migration
  def change
    create_table :quota do |t|
      t.date :_date
      t.references :product, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
