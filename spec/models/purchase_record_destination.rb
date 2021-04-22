require 'rails_helper'

RSpec.describe PurchaseRecordDestination, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_record_destination = FactoryBot.build(:purchase_record_destination, user_id: @user.id, item_id: @item.id)
    sleep 0.5
  end

  describe '購入内容の入力' do
    context '購入出来る時' do
      it '内容に問題ない場合は購入できること' do
        expect(@purchase_record_destination).to be_valid
      end

      it '建物名が空でも購入できること' do
        @purchase_record_destination.building_name = ''
        expect(@purchase_record_destination).to be_valid
      end
    end

    context '購入が出来ない時' do
      it '郵便番号が空だと購入できない' do
        @purchase_record_destination.postal_code = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号はハイフンがないと購入できない' do
        @purchase_record_destination.postal_code = '1234567'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号は数字3つハイフン数字4つがないと購入できない' do
        @purchase_record_destination.postal_code = '01234567'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が未選択では購入できない' do
        @purchase_record_destination.shipping_area_id = 1
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it '市町村が空だと購入できない' do
        @purchase_record_destination.municipality = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと購入できない' do
        @purchase_record_destination.address = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @purchase_record_destination.phone_number = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁以内の数字でないと購入できない' do
        @purchase_record_destination.phone_number = '012345678901'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number is invalid.")
      end
      it '電話番号は11桁以内の数字以外が混じった場合では購入できない' do
        @purchase_record_destination.phone_number = 'ab赤青あいうえお12'
        @purchase_record_destination.valid?
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'クレジットカード情報入力が空だと購入できない' do
        @purchase_record_destination.token = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが無い場合は購入できないこと" do
        @purchase_record_destination.user_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが無い場合は購入できないこと" do
        @purchase_record_destination.item_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end