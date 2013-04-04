class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.text :name
      t.decimal :discount_amt
      t.boolean :valid

      t.timestamps
    end
  end
end
