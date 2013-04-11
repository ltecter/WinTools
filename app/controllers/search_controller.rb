class SearchController < ApplicationController
  def search
    
  end
  def search_results
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
  end
end