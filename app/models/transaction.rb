class Transaction < ApplicationRecord
  # validates :transaction_type,
  #   presence: true, inclusion: { in: %w(buy sell) }
  # validates :value,
  #   presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validates :user_id,
  #   presence: true

  belongs_to :user
  belongs_to :stock
end
