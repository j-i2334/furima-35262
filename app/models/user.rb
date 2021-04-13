class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
      validates :nickname
      validates :birthday
  end

  validates :password, :password_confirmation, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}\z/ }

  with_options presence: true, format: {  with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :first_name
      validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
  end
  has_many :item
#   has_many :purchase_records
end
