class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  has_many :customers
  validates :name, :presence => true
end
