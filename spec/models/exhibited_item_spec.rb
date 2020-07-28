require 'rails_helper'

describe @ExhibitedItem do
  describe '#create' do
    before do
      @ExhibitedItem = FactoryBot.build(:exhibited_item)
    end
    # validな入力
    it 'is valid' do
      expect(@ExhibitedItem).to be_valid
    end
    # 空欄があるとinvalid
    it 'is invalid without a name' do
      @ExhibitedItem.name = ''
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:name]).to include("can't be blank")
    end
    it 'is invalid without a image' do
      @ExhibitedItem.image = nil
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:image]).to include("can't be blank")
    end
    it 'is invalid without a  explanation ' do
      @ExhibitedItem.explanation  = ''
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:explanation ]).to include("can't be blank")
    end
    it 'is invalid without a price ' do
      @ExhibitedItem.price = ''
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:price]).to include("can't be blank")
    end
    it 'is invalid without a category_id' do
      @ExhibitedItem.category_id = ''
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:category_id]).to include("can't be blank")
    end
    it 'is invalid without a status_id' do
      @ExhibitedItem.status_id = ''
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:status_id]).to include("can't be blank")
    end
    it 'is invalid without a payment_id' do
      @ExhibitedItem.payment_id = ''
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:payment_id]).to include("can't be blank")
    end
    it 'is invalid without a prefecture_id' do
      @ExhibitedItem.prefecture_id = ''
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:prefecture_id]).to include("can't be blank")
    end
    it 'is invalid without a until_delivery_id' do
      @ExhibitedItem.until_delivery_id = ''
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:until_delivery_id]).to include("can't be blank")
    end
    # ActiveHashは"---"だと登録できない
    it 'is invalid is category_id is 1' do
      @ExhibitedItem.category_id = '1'
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:category_id]).to include("must be other than 1")
    end
    it 'is invalid status_id is 1' do
      @ExhibitedItem.status_id = '1'
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:status_id]).to include("must be other than 1")
    end
    it 'is invalid payment_id is 1' do
      @ExhibitedItem.payment_id = '1'
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:payment_id]).to include("must be other than 1")
    end
    it 'is invalid prefecture_id is 1' do
      @ExhibitedItem.prefecture_id = '1'
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:prefecture_id]).to include("must be other than 1")
    end
    it 'is invalid until_delivery_id is 1' do
      @ExhibitedItem.until_delivery_id = '1'
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:until_delivery_id]).to include("must be other than 1")
    end
    # priceが300~9,999,999の範囲外は登録できない
    it 'is invalid a small price ' do
      @ExhibitedItem.price = '299'
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:price]).to include("must be greater than or equal to 300")
    end
    it 'is invalid a big price ' do
      @ExhibitedItem.price = '100000000'
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:price]).to include("must be less than or equal to 9999999")
    end
    it 'is invalid a price is not number ' do
      @ExhibitedItem.price = 'あああ'
      @ExhibitedItem.valid?
      expect(@ExhibitedItem.errors[:price]).to include("is not a number")
    end

  end  
end
