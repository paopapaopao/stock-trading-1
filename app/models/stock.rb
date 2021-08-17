class Stock < ApplicationRecord
  validates :company_name,
    presence: true
  validates :price,
    presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :market_cap,
		presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :transactions
end
