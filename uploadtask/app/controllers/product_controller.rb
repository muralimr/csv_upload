class ProductController < ApplicationController
	def index
		@product = Product.all
	end

  def create
	  	Product.import(params[:file])
	  	redirect_to root_url, notice: "Data import"   	
  end

  def get_products
  	   @product = Product.all
	    render json: @product
  	
  end

end
