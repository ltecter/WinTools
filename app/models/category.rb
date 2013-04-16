class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :Products
  validates :name, :presence => true
end
