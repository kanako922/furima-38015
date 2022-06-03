require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品" do

    context "商品出品できる場合" do
      it "全ての情報が完備されていれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品できない場合" do
      it "nameが空では出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空では出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが--では出品できない" do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが--では出品できない" do
        @item.condition_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "charge_idが--では出品できない" do
        @item.charge_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it "prefecture_idが--では出品できない" do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "delivery_date_idが--では出品できない" do
        @item.delivery_date_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "画像が空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "priceは半角でなければ出品できない" do
        @item.price = "１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300円未満では出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが9999999円を超えると出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      
    end
  end

end
