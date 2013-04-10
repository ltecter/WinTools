class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :fname, :lname, :password, :province_id, :username
  belongs_to :province
  has_many :orders
end
