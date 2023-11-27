require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.build(:user)
    end

    context '正常系' do
      it '全ての項目が正しく入力されている場合、有効であること' do
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'メールアドレスが重複している場合は登録できない' do
        existing_user = FactoryBot.create(:user, email: 'test@test')
        @user.email = 'test@test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end

      it 'メールアドレスが@を含まない場合は登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'パスワードが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must contain both letters and numbers"
      end

      it 'パスワードが半角英字のみの場合は登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must contain both letters and numbers"
      end

      it 'パスワードが全角の場合は登録できない' do
        @user.password = 'ｐａｓｓｗｏｒｄ１'
        @user.password_confirmation = 'ｐａｓｓｗｏｒｄ１'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must contain both letters and numbers"
      end

      it 'パスワードとパスワード（確認）が一致しない場合は登録できない' do
        @user.password_confirmation = 'mismatched_password'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'お名前(全角)が空では登録できない' do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kanji can't be blank"
      end

      it 'お名前(全角)が空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kanji can't be blank"
      end

      it 'お名前(全角)が全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
        @user.lastname_kanji = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kanji must be full-width (Kanji, Hiragana, Katakana)"
      end

      it 'お名前(全角)が全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
        @user.firstname_kanji = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kanji must be full-width (Kanji, Hiragana, Katakana)"
      end

      it 'お名前カナ(全角)が空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
      end

      it 'お名前カナ(全角)が空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
      end

      it 'お名前カナ(全角)が全角（カタカナ）でない場合は登録できない' do
        @user.lastname_kana = 'すみす'
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana must be full-width Katakana"
      end

      it 'お名前カナ(全角)が全角（カタカナ）でない場合は登録できない' do
        @user.firstname_kana = 'じょん'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana must be full-width Katakana"
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end