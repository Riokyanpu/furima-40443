require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank") 
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合であること' do
        @user.password = 'password123'
        @user.password_confirmation = 'password123'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("Password は半角英数字混合で入力してください")
      end
      it 'お名前(全角)は、全角（漢字）での入力が必須であること' do
        @user.surname = '山田'
        @user.name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("お名前(全角)は、全角（漢字）での入力が必須です")
      end
      it 'お名前(全角)は、全角（ひらがな）での入力が必須であること' do
        @user.surname = 'やまだ'
        @user.name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("お名前(全角)は、全角（ひらがな）での入力が必須です")
      end
      it 'お名前(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.surname = 'ヤマダ'
        @user.name = 'タロウ'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("お名前(全角)は、全角（カタカナ）での入力が必須です")
      end
      it '生年月日が必須であること' do
        @user.date_of_birth= 'nil'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("生年月日が必須であることが必須です")
      end
    end
  end
end
