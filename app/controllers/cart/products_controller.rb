class Cart::ProductsController < ApplicationController
  before_action :set_product

  def update
    Current.cart.set_product_quantity(@product, params[:quantity])
  end

  private
    def set_product
      @product = Product.new(id: params[:id])
    end
end
