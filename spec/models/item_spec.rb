require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品" do

    context "商品出品できる場合" do
      it "name・price・description・category_id・condition_id・charge_id・prefecture_id・delivery_date_id・imageがあれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品できない場合" do
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空では登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが--では登録できない" do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが--では登録できない" do
        @item.condition_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "charge_idが--では登録できない" do
        @item.charge_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it "prefecture_idが--では登録できない" do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "delivery_date_idが--では登録できない" do
        @item.delivery_date_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "画像が空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "priceは半角でなければ登録できない" do
        @item.price = "１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      
    end
  end

end
