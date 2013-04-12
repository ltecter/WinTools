class CartController < ApplicationController
  before_filter :intialize_cart
  
  def cart
    @cart = []
    @cost = []
    @total = 0
    session[:cart].each do |item|
      cart_item = Product.find(item[:prod_id])
      @cart << cart_item
      cost = cart_time[:price] * item[:quantity]
      @cost << cost
      @total += cost
    end
  end
  
  def add_to_cart
    session[:cart] << {:prod_id => params[:id], :quantity => 1}
  end
  
  def remove_from_cart
    session[:cart].delete_if {|item| item[:prod_id] = params[:id]}
  end
  
  def change_quantity
    session[:cart].each do |item|
      if item[:prod_id] = params[:id]
        item[:quantity] = params[:quantity]
      end
    end
  end
protected
  def intialize_cart
    session[:cart] ||= []
  end
  
end
