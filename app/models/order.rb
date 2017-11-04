class Order < ApplicationRecord
  enum role: ["ordered", "paid", "cancelled", "shipped"]
end