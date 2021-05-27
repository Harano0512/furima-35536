require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が入力されていなくても購入できる' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '全ての値が正しく入力されていなければ、購入できない' do
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がハイフンなし7桁では登録できない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is in valid.Include hyphen(-)")
      end
      it '郵便番号がハイフンなし８桁では登録できない' do
        @order_address.postal_code = "12345678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is in valid.Include hyphen(-)")
      end
      it '都道府県が空では登録できない' do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県を選択していなければ登録できない' do
        @order_address.prefecture_id = "1"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空では登録できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁では登録できない' do
        @order_address.phone_number = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is in valid.")
      end
      it '電話番号に全角は登録できない' do
        @order_address.phone_number = "０１２３４５６７８９０"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is in valid.")
      end
      it '電話番号に文字は登録できない' do
        @order_address.phone_number = "ｱｲｳｴｵｶｷｸｹｺ"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is in valid.")
      end
      it 'order_idがないと登録できない' do
        @order_address.order_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Order can't be blank")
      end
      it 'user_idがないと登録できない' do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと登録できない' do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
