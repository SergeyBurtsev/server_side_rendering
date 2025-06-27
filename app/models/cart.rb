class Cart
  def initialize(session)
    @session = session
    @session[:cart] ||= {}
  end

  def set_product_quantity(product, quantity)
    quantity = quantity.to_i
    session_key = product.id.to_s

    if quantity.positive?
      @session[:cart][session_key] = quantity
    else
      @session[:cart].delete(session_key)
    end
  end

  def [](product_id)
    session_key = product_id.to_s
    @session[:cart][session_key].to_i
  end

  def items
    @session[:cart].map do |product_id, quantity|
      Item.new(
        product: Product.new(id: product_id),
        quantity: quantity
      )
    end
  end

  def total
    items.sum(&:quantity)
  end

  class Item
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :product
    attribute :quantity, :integer
  end
end
