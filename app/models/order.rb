class Order < ApplicationRecord
  enums role: ["ordered", "paid", "cancelled", "shipped"]
end