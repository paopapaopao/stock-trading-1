class Role < ApplicationRecord
  validates :name,
    presence: true, inclusion: { in: %w(buyer broker buyer_and_broker) }
end
