class ImagesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @products = Product.all
    render 'new.html.erb'
  end

  def create
    image1 = Image.new(url: params[:url], product_id: params[:product_id])
    image1.save
    redirect_to "/products"
  end
end
