class RemoveSelfIntroduceMovieUrlFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :self_introduce_movie_url, :string
  end
end
