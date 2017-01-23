class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    response = Unirest.post("http://uploads.im/api?upload", parameters: {file: params[:image]}).body
    product = Product.new(
      name: params[:name],
      image_url: response["data"]["img_url"]
    )
    product.save
    redirect_to "/products"
  end
end
