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
    @count ||= 0
    @cost ||= []
    @total ||= 0
    @items ||= []
    if !session[:cart].empty?
      @count = session[:cart].count
      session[:cart].each do |item|
        prod = Product.find(item[:prod_id])
        @items << prod
        cost = item[:quantity] * prod[:price]
        @cost << cost
        @total += cost
      end
    end
    
    
  end
  
end
