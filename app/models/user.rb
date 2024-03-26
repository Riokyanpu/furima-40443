class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "はひらがな、カタカナ、漢字のみ使用できます" }
  validates :surname_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "はひらがな、カタカナのみ使用できます" }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "はひらがな、カタカナ、漢字のみ使用できます" }
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "はひらがな、カタカナ、漢字のみ使用できます" }
  validates :date_of_birth , presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数字混合で入力してください" }
end
