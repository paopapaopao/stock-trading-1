class Transaction < ApplicationRecord
  validates :transaction_type,
    presence: true, inclusion: { in: %w(buy sell) }
end
