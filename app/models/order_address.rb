class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :address_line, :building, :tel

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address_line
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/ } 
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address_line: address_line, tel: tel, order_id: @order.id)
  end
end