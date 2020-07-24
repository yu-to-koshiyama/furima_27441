class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :nickname, presence: true      
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :encrypted_password, presence: true, format:{ with: /[a-z\d]{6,}/i }

  validates :family_name, :first_name, presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true 
end
