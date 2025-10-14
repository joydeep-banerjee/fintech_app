class Organization < ApplicationRecord
  has_many :contacts, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
