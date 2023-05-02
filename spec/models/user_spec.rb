require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録の正常系テスト' do
      it '全項目正しく入力すれば登録できる' do
      end
    end
    context 'ユーザー新規登録の異常系テスト' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'Passwordが129文字以上では登録できない' do
      end
      it 'Passwordは半角英数字混合でないと登録できない' do
      end
      it 'password_confirmationが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'last_nameが英語では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'first_nameが英語では登録できない' do
      end
      it 'ruby_last_nameが空では登録できない' do
      end
      it 'ruby_last_nameがカタカナでないと登録できない' do
      end
      it 'ruby_first_nameが空では登録できない' do
      end
      it 'ruby_first_nameがカタカナでないと登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
    end
  end
end
