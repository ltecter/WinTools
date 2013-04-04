class Customers < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :fname, :lname, :password, :province_id, :username
end
