require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context "新規登録できる場合" do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すると登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できない場合" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "emailが重複していれば登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@を含まなければ登録できない" do
        @user.email = "testmail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "12345"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが129文字以上では登録できない" do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it "passwordとpassword_confirmationが一致していなければ登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '654321'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは半角英語のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは半角数字のみでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは全角では登録できない" do
        @user.password = "ａｂｃ１２３"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "last_nameが漢字・ひらがな・カタカナ以外だと登録出来ない" do
        @user.last_name = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが漢字・ひらがな・カタカ以外だと登録出来ない" do
        @user.first_name = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaがカタカナ以外だと登録出来ない" do
        @user.last_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaがカタカナ以外だと登録出来ない" do
        @user.first_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end
