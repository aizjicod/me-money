class Expense < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { maximum: 18, too_long: '%<count>s characters is the maximum allowed' }
  validates :amount, presence: true, numericality: { only_integer: true }
end
