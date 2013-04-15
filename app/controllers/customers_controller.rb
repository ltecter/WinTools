class CustomersController < ApplicationController
  def user_credentials
    @customer = Customer.new
    @provinces = Province.order(:name)
  end
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to order_url, notice: 'Credentials successfully created.' }
      else
        format.html { render action: "user_credentials" }
      end
    end
  end
end
