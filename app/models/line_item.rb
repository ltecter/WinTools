class LineItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity
  belongs_to :product
  belongs_to :order
  validates :product_id, :presence => true
end
