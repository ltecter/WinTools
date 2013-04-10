class RenameValidToAvailableInDiscounts < ActiveRecord::Migration
  def change
      rename_column :discounts, :valid, :available
  end
end
