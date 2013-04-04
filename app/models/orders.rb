class Orders < ActiveRecord::Base
  attr_accessible :customer_id, :discount_id, :gst_rate, :hst_rate, :pst_rate, :status
end
