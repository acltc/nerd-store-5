class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:input_product_id])
    subtotal = params[:input_quantity].to_i * product.price
    tax = subtotal * 0.09
    total = subtotal + tax
    order1 = Order.new(
      user_id: current_user.id,
      quantity: params[:input_quantity],
      product_id: params[:input_product_id],
      tax: tax,
      subtotal: subtotal,
      total: total
    )
    order1.save
    p 'order1'
    p order1
    redirect_to "/orders/#{order1.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
