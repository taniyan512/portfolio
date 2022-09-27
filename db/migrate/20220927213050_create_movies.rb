class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.integer :user_id
      t.string :movie_url

      t.timestamps
    end
  end
end
