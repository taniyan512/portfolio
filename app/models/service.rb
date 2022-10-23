class Service < ApplicationRecord
  belongs_to :user

  validates :lesson_price, :lesson_time, :lesson_detail, presence: true
end
