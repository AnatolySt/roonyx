FactoryBot.define do
  factory :first_sale, class: Sale do
    revenue { 75000 }
    date { Date.new(2017, 03, 01) }
    good
  end


  factory :last_sale, class: Sale do
    revenue { 75000 }
    date { Date.new(2017, 03, 02) }
    good
  end
end