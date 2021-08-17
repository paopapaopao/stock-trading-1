class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :role,
  #   presence: true, inclusion: { in: %w(buyer broker buyer_and_broker) }
  validates :password,
    presence: true, length: { in: 8..50 }
  # validates :first_name,
  #   presence: true
  # validates :last_name,
  #   presence: true

  belongs_to :role
  has_many :stocks
  has_many :transactions
end
