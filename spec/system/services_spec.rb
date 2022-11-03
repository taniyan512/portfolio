require 'rails_helper'

RSpec.describe "Services", type: :system do
  before do
    driven_by(:rack_test)
  end
  describe 'services CRUD' do
    describe 'サービス登録' do
      context '正しく入力' do
        it '登録成功' do
          visit new_user_registration_path
          fill_in 'user[email]', with: 'a@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録する！'
          visit new_service_path
          fill_in 'lesson_detail', with: 'テストです。'
          click_button '作成'
          expect(page).to have_text('響け、私のギター。')
        end
      end
      context 'レッスン内容未入力' do
        it '登録失敗' do
          visit new_user_registration_path
          fill_in 'user[email]', with: 'a@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録する！'
          visit new_service_path
          fill_in 'lesson_detail', with: nil
          click_button '作成'
          expect(page).to have_text('レッスン内容を入力してください')
        end
      end
    end
  end

end
