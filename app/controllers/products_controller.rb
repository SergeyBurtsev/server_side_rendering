class ProductsController < ApplicationController
  PER_PAGE = 12

  def index
    @current_page = params[:page] ? params[:page].to_i : 1
    @products = PER_PAGE.times.map do |index|
      Product.new(id: (@current_page - 1) * PER_PAGE + index + 1)
    end
  end

  def show
    @product = Product.new(id: params[:id])
  end
end
