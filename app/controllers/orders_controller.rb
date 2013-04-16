class OrdersController < ApplicationController
  def show
    @sub_total = @total
    @customer = session['cust']
    province = Province.find(@customer[:province_id])
    pst = province.pst
    gst = province.gst
    hst = province.hst
    pst_amount = (((pst * @total)*100).round)/100.0
    gst_amount = (((gst * @total)*100).round)/100.0
    hst_amount = (((hst * @total)*100).round)/100.0
    @taxes = []
    @taxes.push({:tax => "PST", :amount => pst_amount}) unless pst.zero?
    @taxes.push({:tax => "GST", :amount => gst_amount}) unless gst.zero?
    @taxes.push({:tax => "HST", :amount => hst_amount}) unless hst.zero?
    @order_total = @total + pst_amount + gst_amount + hst_amount
  end
  def create
    @customer = Customer.find(session['cust_id'])
    order = @customer.orders.build
    order.status = 'new'
    province = Province.where(:id => @customer.province_id)
    order.pst_rate = province[0].pst
    order.gst_rate = province[0].gst
    order.hst_rate = province[0].hst
    
    if order.save
      session[:cart].each do |item|
        product = Product.find(item[:prod_id])
        line_item = order.line_items.build
        line_item.product = product
        line_item.quantity = item[:quantity]
        line_item.price = product.price
        line_item.save
      end
      reset_session
      redirect_to root_url, notice: 'Your order has been created.'      
    else
      redirect_to root_url, error: 'Unable to create order.'
    end    
  end
end
