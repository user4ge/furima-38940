class OrderShipping
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 11, message: 'is invalid' }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create( user_id: user_id, item_id: item_id )
    Shipping.create( postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, order_id: order.id )
  end
end
