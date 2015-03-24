class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :client
      t.decimal :total
      t.integer :quality
      t.references :book, index: true

      t.timestamps
    end
  end
end
