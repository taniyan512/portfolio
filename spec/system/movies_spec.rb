require 'rails_helper'

RSpec.describe "Movies", type: :system do
  before do
    driven_by(:rack_test)
  end
  describe 'movie CRUD' do
    describe '動画添付' do
      context '正しく入力' do
        it '動画添付成功' do
          visit new_user_registration_path
          fill_in 'user[email]', with: 'a@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録する！'
          visit new_movie_path
          fill_in 'movie[movie_url]', with: 'https://www.youtube.com/watch?v=1FliVTcX8bQ'
          click_button '作成'
          expect(page).to have_button('編集')
        end
      end
      
      context 'urlが未入力' do
        it '動画添付失敗' do
          visit new_user_registration_path
          fill_in 'user[email]', with: 'a@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録する！'
          visit new_movie_path
          fill_in 'movie[movie_url]', with: nil
          click_button '作成'
          expect(page).to have_text('貼りたいyoutubeのurlを入力してください')
        end
      end
    end
  end
end
