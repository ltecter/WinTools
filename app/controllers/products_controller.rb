class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @categories = Category.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
  
  def products_by_category
    @products = Product.where('category_id = ' + params[:id])
  end
  
  def cart
    #@total = 1
    #session[:cart].each do |item|
    #  cart_item = Product.find(item['prod_id'])
    #  @cart << cart_item
    #  cost = cart_time[:price]
    #  @cost << cost
    #  @total += 1
    #end
  end
  
  def add_to_cart
    session[:cart] << {:prod_id => params[:id], :quantity => 1}
    redirect_to root_url
  end
  
  def remove_from_cart
    session[:cart] = session[:cart].reject { |h| params[:id].include? h[:prod_id] }
    redirect_to root_url
  end
  
  def change_quantity
    session[:cart].each do |item|
      if item[:prod_id] = params[:id]
        item[:quantity] = params[:quantity]
      end
    end
    redirect_to root_url
  end
  
  def clear_cart
    reset_session
    redirect_to root_url
  end
  
  def checkout
    
  end
end
