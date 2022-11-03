require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe '動画のテスト' do
    it '動画のurlが貼られると保存されること' do
      movie = build(:movie)
      expect(movie).to be_valid
    end

    it '空欄だと保存ができないこと' do
      movie = build(:movie)
      movie.movie_url = ''
      expect(movie).to be_invalid
    end
  end
end
