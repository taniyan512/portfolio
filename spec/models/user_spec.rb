require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    it 'email,passwordが存在すれば登録出来ること' do
      user = build(:user)
      expect(user).to be_valid
    end
    
    it 'emailが空欄の時、登録できないこと' do
      user = build(:user)
      user.email = ''
      expect(user).to be_invalid
    end
    
    it 'passwordが空欄の時、登録できないこと' do
      user = build(:user)
      user.password = ''
      expect(user).to be_invalid
    end
    
  end

  describe 'プロフィール登録' do
    it 'user_nameが存在すれば登録出来ること' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe 'リレーション' do
    it 'userモデルを削除したとき、serviceモデルも削除されること' do
      user = build(:user)
      user.services << build(:service)
      user.save
      expect{ user.destroy }.to change{ Service.count }.by(-1)
    end

    it 'userモデルを削除したとき、movieモデルも削除されること' do
      user = build(:user)
      user.movies << build(:movie)
      user.save
      expect{ user.destroy }.to change{ Movie.count }.by(-1)
    end
  end

end
