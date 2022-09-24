class AddDetailsToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :lesson_time, :integer
    add_column :services, :lesson_price, :integer
    add_column :services, :lesson_detail, :string
  end
end
