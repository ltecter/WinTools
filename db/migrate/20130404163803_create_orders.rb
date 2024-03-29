class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :status
      t.decimal :pst_rate
      t.decimal :gst_rate
      t.decimal :hst_rate
      t.integer :customer_id
      t.integer :discount_id

      t.timestamps
    end
  end
end
