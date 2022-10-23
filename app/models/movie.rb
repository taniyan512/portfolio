class Movie < ApplicationRecord
  belongs_to :user

  validates :movie_url, presence: true
end
