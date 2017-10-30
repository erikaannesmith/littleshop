FactoryBot.define do
  factory :item do
    sequence(:title) { |n| "Item #{n}"}
    sequence(:description) { |n| "This is a description #{n}"}
    sequence(:price) { |n| n }
    image "http://vignette1.wikia.nocookie.net/logopedia/images/a/a4/Google-Currents-Featured-300x300.png/revision/latest?cb=20120704191200"
  end
end
