FactoryBot.define do
  factory :item do
    sequence(:title) { |n| "Item #{n}"}
    sequence(:description) { |n| "This is a description #{n}"}
    sequence(:price) { |n| n }
    File.open('1.jpg') do |f|
      image = f
    end
  end
end
