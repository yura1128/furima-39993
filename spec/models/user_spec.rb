require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'lastname_kanjiが空では登録できない' do
      @user.lastname_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname kanji can't be blank"
    end
    it 'firstname_kanjiが空では登録できない' do
      @user.firstname_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname kanji can't be blank"
    end
    it 'lastname_kanaが空では登録できない' do
      @user.lastname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
    end
    it 'firstname_kanaが空では登録できない' do
      @user.firstname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
