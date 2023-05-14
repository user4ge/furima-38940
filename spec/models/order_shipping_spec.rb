require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    end

    context '商品購入ができる場合' do
      it '全項目が入力されていれば購入できる' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingが未入力でも購入できる' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end
    context '商品購入ができない場合' do
      it 'postcodeが未入力だと購入できない' do
        @order_shipping.postcode = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeに‐がないと購入できない' do
        @order_shipping.postcode = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'postcodeに「3桁ハイフン4桁」の半角文字列のみでないと購入できない' do
        @order_shipping.postcode = '１２３-４５６７'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが未選択だと購入できない' do
        @order_shipping.prefecture_id = '1'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが未入力だと購入できない' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが未入力だと購入できない' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが未入力だと購入できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では購入できない' do
        @order_shipping.phone_number = '12345678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上では購入できない' do
        @order_shipping.phone_number = '123456789012'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角数値でないと購入できない' do
        @order_shipping.phone_number = '0901234567８'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐づいていないと購入できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
