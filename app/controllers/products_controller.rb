class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    # if session[:page_count] == nil
    #   session[:page_count] = 1
    # else
    #   session[:page_count] += 1
    # end
    # if params[:sort_order]
    #   @products = Product.order(:price => params[:sort_order])
    # elsif params[:price_category] == 'discount'
    #   @products = Product.where("price < ?", '4')
    # elsif params[:search_term]
    #   @products = Product.where("name LIKE ?", "%#{params[:search_term]}%")
    # else
    #   @products = Product.all
    # end
    # code to filter by category
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    else
      @products = Product.all
    end
    render "index.html.erb"
  end

  def new
    @product = Product.new
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      # image: params[:image],
      price: params[:price]
    )

    if @product.save
      flash[:success] = "Product Created"
      redirect_to "/products/#{@product.id}"
    else
      render 'new.html.erb'
    end
  end

  def show
    if params[:id] == 'random'
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    render "show.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price]
    )
    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "Product Destroyed"
    redirect_to "/"
  end
end

