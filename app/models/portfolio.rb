class Portfolio < ApplicationRecord
  belongs_to :contact
  validates :title, presence: true
  validates :balance, presence: true
  validates :performance, presence: true
end
