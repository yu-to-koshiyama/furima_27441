require 'rails_helper'

RSpec.describe PurchaseDealing, type: :model do
  describe '#create' do
    before do
      @purchase_dealing = FactoryBot.build(:purchase_dealing)
    end

    it 'is vailid' do
      @purchase_dealing.valid?
      expect(@purchase_dealing).to be_valid
    end
    # 空欄があるとinvalid
    it 'is invalid without a postal_code' do
      @purchase_dealing.postal_code = ''
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:postal_code]).to include("can't be blank")
    end
    it 'is invalid without an prefecture_id' do
      @purchase_dealing.prefecture_id = ''
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:prefecture_id]).to include("can't be blank")
    end
    it 'is invalid without an city' do
      @purchase_dealing.city = ''
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:city]).to include("can't be blank")
    end
    it 'is invalid without an house_number' do
      @purchase_dealing.house_number = ''
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:house_number]).to include("can't be blank")
    end
    it 'is invalid without an phone_number' do
      @purchase_dealing.phone_number = ''
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:phone_number]).to include("can't be blank")
    end
    it 'is invalid without an token ' do
      @purchase_dealing.token = ''
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:token]).to include("can't be blank")
    end
    # ActiveHashは"---"だと登録できない
    it 'is invalid prefecture_id is 1' do
      @purchase_dealing.prefecture_id = '1'
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:prefecture_id]).to include('must be other than 1')
    end
    # 郵便番号は'XXX-XXXX'の形式でないと登録できない
    it 'is invalid a postal_code is not number ' do
      @purchase_dealing.postal_code = 'あああ'
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:postal_code]).to include('is invalid')
    end
    it 'is invalid a postal_code is invalid' do
      @purchase_dealing.postal_code = '0000000'
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:postal_code]).to include('is invalid')
    end
    it 'is invalid a postal_code is invalid' do
      @purchase_dealing.postal_code = '000000-0'
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:postal_code]).to include('is invalid')
    end
    # 電話番号は半角英数字11字
    it 'is invalid a phone_number is invalid' do
      @purchase_dealing.phone_number = 'あああ'
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:phone_number]).to include('is invalid')
    end
    it 'is invalid a phone_number is invalid' do
      @purchase_dealing.phone_number = '1234567890'
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:phone_number]).to include('is invalid')
    end
    it 'is invalid a phone_number is invalid' do
      @purchase_dealing.phone_number = '123456789000'
      @purchase_dealing.valid?
      expect(@purchase_dealing.errors[:phone_number]).to include('is invalid')
    end
  end
end
