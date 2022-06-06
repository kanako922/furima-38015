require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品の購入" do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1 
    end

    context "購入できる場合" do
      it "全ての値が正しく入力されていれば購入できる" do
        expect(@order_address).to be_valid
      end
      it "buildingが空でも購入できる" do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end

    context "購入できない場合" do

      it "zip_codeが空では購入できない" do
        @order_address.zip_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it "prefecture_idが空では購入できない" do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では購入できない" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "address_lineが空では購入できない" do
        @order_address.address_line = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line can't be blank")
      end
      it "telが空では購入できない" do
        @order_address.tel = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
      it "userが紐付いてないと購入できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いてないと購入できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "zip_codeは3桁[-]4桁の半角のみ保存可能" do
        @order_address.zip_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid")
      end
      it "telは10桁以上11桁以内の半角数値のみ保存可能" do
        @order_address.tel = "123-4567-8901"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end
    end

  end
end
