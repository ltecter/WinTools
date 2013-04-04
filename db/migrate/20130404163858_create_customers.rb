class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.text :fname
      t.text :lname
      t.text :address
      t.text :city
      t.integer :province_id
      t.text :country
      t.text :email
      t.text :username
      t.text :password

      t.timestamps
    end
  end
end
