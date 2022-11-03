require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'サービスのテスト' do
    it 'レッスンの詳細が記入されるとサービスが登録できること' do
      service = build(:service)
      expect(service).to be_valid
    end

    it 'レッスンの詳細が空欄だと登録できないこと' do
      service = build(:service)
      service.lesson_detail = ''
      expect(service).to be_invalid
    end
  end
end
