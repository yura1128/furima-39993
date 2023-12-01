class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase_records

  validates :nickname, :firstname_kanji, :lastname_kanji, :firstname_kana, :lastname_kana, :birthday, presence: true

  validate  :password_complexity
  validates :lastname_kanji, :firstname_kanji, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/, message: "must be full-width (Kanji, Hiragana, Katakana)" }
  validates :lastname_kana, :firstname_kana, format: { with: /\A[\p{Katakana}]+\z/, message: "must be full-width Katakana" }

  private

  def password_complexity
    return if password.blank?

    unless password.match?(/^(?=.*[a-zA-Z])(?=.*\d)/)
      errors.add(:password, 'must contain both letters and numbers')
    end
  end
end
