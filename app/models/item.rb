class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :delivery_date

  validates :name, :description, :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  with_options presence: true, numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :delivery_date_id 
  end

end
