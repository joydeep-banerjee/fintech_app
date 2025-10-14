class Contact < ApplicationRecord
  belongs_to :organization
  has_many :portfolios, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # def get_portfolio_summary(contact)
  #   portfolios = contact.portfolios.pluck(:performance)
  #   max_performance = portfolios.map(&:to_f).select(&:positive?).max
  #   min_performance = portfolios.map(&:to_f).select(&:negative?).min | portfolios.map(&:to_f).select(&:positive?).min
  #   { max: max_performance, min: min_performance }
  # end
end
