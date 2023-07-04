class Operation < ApplicationRecord
  belongs_to :category

  validates :odate, presence: true
  validates :amount, comparison: { greater_than: 0 }
  validates :description, presence: true

  paginates_per 10
end
