class OrdersController < ApplicationController
  before_action :authenticate_user!
  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def create
    # make a new order in the db
    carted_products = current_user.carted_products.where(status: 'carted')
    sum = 0
    carted_products.each do |carted_product|
      sum += carted_product.product.price * carted_product.quantity
    end
    subtotal = sum
    tax_rate = 0.09
    tax = subtotal * tax_rate
    total = subtotal + tax
    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    order.save

    carted_products.each do |carted_product|
      carted_product.update(order_id: order.id, status: 'purchased')
    end
    redirect_to "/orders/#{order.id}"
  end
end
