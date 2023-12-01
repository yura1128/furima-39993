require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規投稿機能' do

    before do
      @item = FactoryBot.build(:item)
    end

    context '正常系' do
      it '全ての項目が正しく入力されている場合、有効であること' do
        expect(@item).to be_valid
      end
    end

    context '異常系' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end

      it '商品説明が空では登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end

      it 'カテゴリーが---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
    
      it '商品の状態が---では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item condition must be other than 1'
      end
    
      it '配送料の負担が---では登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee must be other than 1'
      end
    
      it '発送元の地域が---では登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping area must be other than 1'
      end
    
      it '発送までの日数が---では登録できない' do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Estimated shipping date must be other than 1'
      end

      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300未満の場合は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be in 300..9999999"
      end

      it '価格が10,000,000以上の場合は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be in 300..9999999"
      end

      it '半角数字以外の値が含まれている場合は登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end

    end
  end
end