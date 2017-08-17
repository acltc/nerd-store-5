class ImagesController < ApplicationController
  def new
    @products = Product.all
    render 'new.html.erb'
  end

  def create
    image1 = Image.new(url: params[:url], product_id: params[:product_id])
    image1.save
    p "here are the image errors"
    p image1.errors.full_messages
    p "there were the image errors"
    redirect_to "/products"
  end
end
