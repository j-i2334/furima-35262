require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できること' do
      it 'passwordが6文字以上で半角英数字であれば登録できること' do
        @user.password = '000aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    context '新規登録できないこと' do
      it 'emailが空では登録できないこと' do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がないと登録できないこと' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが半角英数字混合でなければ登録できないこと' do
        @user.password = 'あいうABC'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが英字だけでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字だけでは登録できないこと' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '確認用パスワードがない場合は登録できないこと' do
        @user.password_confirmation = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '名字がない場合は登録できないこと' do
        @user.last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it '名前がない場合は登録できないこと' do
        @user.first_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it '名字が全角(漢字・ひらがな・カタカナ)入力でなければ登録できないこと' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it '名前が全角(漢字・ひらがな・カタカナ)入力でなければ登録できないこと' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it '名字にフリガナがない場合は登録できないこと' do
        @user.last_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it '名前にフリガナがない場合は登録できないこと' do
        @user.first_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '名字のフリガナは全角(カタカナ)入力でなければ登録できないこと' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it '名前のフリガナは全角(カタカナ)入力でなければ登録できないこと' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '生年月日がない場合は登録できないこと' do
        @user.birthday = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
