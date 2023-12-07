require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '配送先情報' do
    before do
      # 正常な値で初期化
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase = FactoryBot.build(:purchase, item_id: item.id, user_id: user.id)
    end

    context '正常系' do
      it '全ての項目が正しく入力されている場合、有効であること' do
        expect(@purchase).to be_valid
      end

      it '建物名が空でも有効であること' do
        @purchase.building_name = ''
        expect(@purchase).to be_valid
      end
    end

    context '異常系' do
      it '郵便番号が空では登録できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Postal code can't be blank"
      end

      it '郵便番号が正しい形式でない場合は登録できない' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Postal code is invalid. Enter it as follows (e.g. 123-4567)"
      end

      it '都道府県が選択されていない場合は登録できない' do
        @purchase.shipping_area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Shipping area must be other than 1"
      end

      it '市区町村が空では登録できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "City can't be blank"
      end

      it '番地が空では登録できない' do
        @purchase.street = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Street can't be blank"
      end

      it '電話番号が空では登録できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Phone number can't be blank"
      end

      it '電話番号が数字以外の文字を含む場合は登録できない' do
        @purchase.phone_number = '123-456-7890'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Phone number is invalid. Input only numbers"
      end

      it '電話番号が9桁以下では登録できない' do
        @purchase.phone_number = '123456789' # 9桁
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Phone number is invalid. Input only numbers"
      end
    
      it '電話番号が12桁以上では登録できない' do
        @purchase.phone_number = '123456789012' # 12桁
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Phone number is invalid. Input only numbers"
      end
    
      it 'tokenが空では登録できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Token can't be blank"
      end

      it 'ユーザーIDが空では登録できない' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "User can't be blank"
      end

      it '商品のIDが空では登録できない' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end