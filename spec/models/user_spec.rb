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

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '英字のみのパスワードでは登録できないこと' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
    
      it '数字のみのパスワードでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
    
      it '全角文字を含むパスワードでは登録できないこと' do
        @user.password = 'パスワード１２３'
        @user.password_confirmation = 'パスワード１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '姓(全角)が空では登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).not_to include("お名前(全角)は、全角（漢字）での入力が必須です")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.surname = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓（全角）はひらがな、カタカナ、漢字のみ使用できます')
      end

      it '姓(全角)は、全角（漢字）での入力が必須であること' do
        @user.surname = '山田'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("姓(全角)は、全角（漢字）での入力が必須です")
      end
      
      it 'お名前(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.surname = 'ヤマダ'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("お名前(全角)は、全角（カタカナ）での入力が必須です")
      end

      it '姓全角)は、全角（ひらがな）での入力が必須であること' do
        @user.surname = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("姓(全角)は、全角（ひらがな）での入力が必須です")
      end

      it '名(全角)が空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).not_to include("名(全角)は、全角（漢字）での入力が必須です")
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.name = 'Tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('名（全角）はひらがな、カタカナ、漢字のみ使用できます')
      end

      it 'お名前(全角)は、全角（漢字）での入力が必須であること' do
        @user.name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("お名前(全角)は、全角（漢字）での入力が必須です")
      end

      it 'お名前(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.name = 'タロウ'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("お名前(全角)は、全角（カタカナ）での入力が必須です")
      end

      it 'お名前(全角)は、全角（ひらがな）での入力が必須であること' do
        @user.name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("お名前(全角)は、全角（ひらがな）での入力が必須です")
      end
      
      it '生年月日が必須であること' do
        @user.date_of_birth= 'nil'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("生年月日が必須であることが必須です")
      end
    end
  end
end
