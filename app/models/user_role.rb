class UserRole < ApplicationRecord
  validates :role_id,
    presence: true
end
