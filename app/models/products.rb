class Products < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock_quantity
end