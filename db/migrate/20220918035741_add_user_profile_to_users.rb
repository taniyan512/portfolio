class AddUserProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :self_introduce, :string
    add_column :users, :self_introduce_movie_url, :string
    add_column :users, :youtube_url, :string
    add_column :users, :instagram_url, :string
    add_column :users, :twitter_url, :string
  end
end
