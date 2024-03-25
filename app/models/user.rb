class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "はひらがな、カタカナ、漢字のみ使用できます" }
  validates :surname_kana, presence: true, format: { with: /\A[ぁ-んァ-ンー－]+\z/, message: "はひらがな、カタカナのみ使用できます" }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "はひらがな、カタカナ、漢字のみ使用できます" }
  validates :name_kana, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "はひらがな、カタカナ、漢字のみ使用できます" }
  validates :date_of_birth , presence: true
  
end
