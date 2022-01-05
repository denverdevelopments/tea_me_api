class Tea < ApplicationRecord
  has_many :subscriptions
  has_many :customers, through: :subscriptions

  # validates :type, presence: true
  validates :variety, presence: true
  validates :description, presence: true
  validates :temp, presence: true, numericality: true
  validates :brew_time, presence: true, numericality: true
end
