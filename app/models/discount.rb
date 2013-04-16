class Discount < ActiveRecord::Base
  attr_accessible :discount_amt, :name, :available
  validates :name, :presence => true
end
