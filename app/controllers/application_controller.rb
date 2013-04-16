class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_categories
  before_filter :initialize_cart
protected 
  def load_categories
    @categories = Category.all
  end
  
  def initialize_cart
    session[:cart] ||= []
    @cart ||= []
    @qty ||= 0
    @cost ||= []
    @total ||= 0
    @items ||= []
    @quantities ||= []
    @prod_id = []
    if !session[:cart].empty?      
      session[:cart].each do |item|
        @qty += item[:quantity].to_i
        @quantities << item[:quantity].to_i
        @prod_id << item[:prod_id]
        prod = Product.find(item[:prod_id])
        @items << prod
        cost = item[:quantity].to_i * prod[:price].to_f
        @cost << cost
        @total += cost.to_f
      end
    end
    
    
  end
  
end
