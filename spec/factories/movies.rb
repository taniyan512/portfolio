FactoryBot.define do
  factory :movie do
    movie_url {'https://www.youtube.com/watch?v=TaDfYTaflAw'}

    association :user
  end
end
