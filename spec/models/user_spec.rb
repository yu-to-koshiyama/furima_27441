require 'rails_helper'
describe User do
  describe '#create' do
    # validな入力
    it 'is valid' do
      user = build(:user)
      expect(user).to be_valid
    end
    # 空欄があるとinvalid
    it 'is invalid without a nickname' do
      user = build(:user, nickname: '')
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it 'is invalid without an email' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it 'is invalid without an family_name' do
      user = build(:user, family_name: '')
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
    it 'is invalid without an first_name' do
      user = build(:user, first_name: '')
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it 'is invalid without an family_name_kana' do
      user = build(:user, family_name_kana: '')
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end
    it 'is invalid without an first_name_kana' do
      user = build(:user, first_name_kana: '')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it 'is invalid without an birthday' do
      user = build(:user, birthday: '')
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
    # すでに登録されいるemailだと登録できない
    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end
    # 登録用と確認用のパスワード入力が一致しないと登録できない
    it 'is invalid without Password_confirmation' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "doesn't match Password" do
      user = build(:user, password_confirmation: 'test')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    # パスワードが短い(7字より小さい)と登録できない
    it 'is invalid with a password that has less than 6 characters ' do
      user = build(:user, password: 'te000', password_confirmation: 'te000')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
    # パスワードが英字のみ、または、数字のみだと登録できない
    it 'is invaild with a password that include both letters and numbers' do
      user = build(:user, password: 'aaaaaaa', password_confirmation: 'aaaaaaa')
      user.valid?
      expect(user.errors[:password]).to include('is invalid')
    end
    it 'is invaild with a password that include both letters and numbers' do
      user = build(:user, password: '1111111', password_confirmation: '1111111')
      user.valid?
      expect(user.errors[:password]).to include('is invalid')
    end

    # 姓と名は全角でないと登録できない
    it 'is invalid half_width family_name' do
      user = build(:user, family_name: 'ﾔﾏﾀﾞ')
      user.valid?
      expect(user.errors[:family_name]).to include('is invalid')
    end
    it 'is invalid half_width first_name' do
      user = build(:user, first_name: 'ﾘｸﾀﾛｳ')
      user.valid?
      expect(user.errors[:first_name]).to include('is invalid')
    end
    # カナの姓と名は全角でないと登録できない
    it 'is invalid half_width family_name_kana' do
      user = build(:user, family_name_kana: 'ﾔﾏﾀﾞ')
      user.valid?
      expect(user.errors[:family_name_kana]).to include('is invalid')
    end
    it 'is invalid half_width first_name_kana' do
      user = build(:user, first_name_kana: 'ﾘｸﾀﾛｳ')
      user.valid?
      expect(user.errors[:first_name_kana]).to include('is invalid')
    end
  end
end
