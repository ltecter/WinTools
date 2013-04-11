class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock_quantity, :image, :category_id 
  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category
  mount_uploader :image, ImageUploader
end
