class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :surname, presence: true
  validates :surname_kana, presence: true
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :date_of_birth , presence: true
  
end