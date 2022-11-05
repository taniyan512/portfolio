require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  

  describe 'user CRUD' do
    describe 'ログイン前' do
      describe '新規登録' do
        context 'フォームの入力が正常' do
          it 'ユーザーの新規登録が成功' do
            visit new_user_registration_path
            fill_in 'user[email]', with: 'a@example.com'
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button '登録する！'
            expect(page).to  have_text('プロフィール')
          end
        end
        context 'メールアドレスが未記入' do
          it 'ユーザーの登録が失敗' do
            visit new_user_registration_path
            fill_in 'user[email]', with: nil
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button '登録する！'
            expect(page).to  have_text('Welcome!')  
          end
        end
        context 'パスワードが未記入' do
          it 'ユーザーの登録が失敗' do
            visit new_user_registration_path
            fill_in 'user[email]', with: 'a@example.com'
            fill_in 'user[password]', with: nil
            fill_in 'user[password_confirmation]', with: nil
            click_button '登録する！'
            expect(page).to  have_text('Welcome!')  
          end
        end
        context '確認パスワードがパスワードと不一致' do
          it 'ユーザーの登録が失敗' do
            visit new_user_registration_path
            fill_in 'user[email]', with: 'a@example.com'
            fill_in 'user[password]', with: 'password1'
            fill_in 'user[password_confirmation]', with: 'password2'
            click_button '登録する！'
            expect(page).to  have_text('Welcome!')
          end
        end
        context 'パスワードが6文字未満' do
          it 'ユーザーの登録が失敗' do
            visit new_user_registration_path
            fill_in 'user[email]', with: 'a@example.com'
            fill_in 'user[password]', with: 'pass'
            fill_in 'user[password_confirmation]', with: 'pass'
            click_button '登録する！'
            expect(page).to  have_text('Welcome!')  
          end
        end
        it 'user_nameが空欄の時、登録できないこと' do
          visit new_user_registration_path
          fill_in 'user[email]', with: 'a@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録する！'
          fill_in 'user_name', with: nil
          click_button '更新'
          expect(page).to have_text('ユーザー名を入力してください')
        end
      end
      
      it 'サービス申し込みができないこと' do
        visit services_path(user.id)
        expect(page).to have_no_text('申し込む')
      end

      it 'ゲストログインができること' do
        post users_guest_sign_in_path
        expect(response).to redirect_to top_path_url
      end

    end
    describe 'ログイン後' do
      it 'ログアウトができること' do
        visit new_user_registration_path
        fill_in 'user[email]', with: 'a@example.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '登録する！'
        click_button 'ログアウト'
        expect(page).to  have_text('響け、私のギター。')
      end
    end 
end
end