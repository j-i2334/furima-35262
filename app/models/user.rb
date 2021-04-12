class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :encrypted_password, :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }
  with_options presence: true do
    validates :first_name
    validates :last_name
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/ } do
      validates :first_name
      validates :last_name
    end
  end

  with_options presence: true do
    validates :first_name_kana
    validates :last_name_kana
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
  validates :birthday, presence: true
end
