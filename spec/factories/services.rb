FactoryBot.define do
  factory :service do
    lesson_time    {30}
    lesson_price   {3000}
    lesson_detail  {'初心者でもわかりやすく説明します。'}

    association :user
  end
end
