class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, :firstname_kanji, :lastname_kanji, :firstname_kana, :lastname_kana, :birthday, presence: true

  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must contain @ symbol" }
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])/, message: "must contain both letters and numbers" }
  validates :password_confirmation, presence: true
  validates :lastname_kanji, :firstname_kanji, presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/, message: "must be full-width (Kanji, Hiragana, Katakana)" }
  validates :lastname_kana, :firstname_kana, presence: true, format: { with: /\A[\p{Katakana}]+\z/, message: "must be full-width Katakana" }
end
