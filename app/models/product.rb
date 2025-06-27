class Product
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :integer

  def name
    "Product ##{id}"
  end

  def persisted?
    true
  end
end
