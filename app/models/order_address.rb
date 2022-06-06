class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :address_line, :building, :tel

  validates :user_id, :item_id, :zip_code, :city, :address_line, :tel, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address_line: address_line, tel: tel, order_id: @order.id)
  end
end