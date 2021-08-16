class Stock < ApplicationRecord
  validates :company_name,
    presence: true
end
