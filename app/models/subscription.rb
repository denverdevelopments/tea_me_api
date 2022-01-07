class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  validates :title, presence: true
  validates :price, presence: true, numericality: true
  enum status: [:active, :paused, :cancelled]  #, default: :0
  enum frequency: [:monthly, :bi_monthly, :half_yearly, :yearly]
end
