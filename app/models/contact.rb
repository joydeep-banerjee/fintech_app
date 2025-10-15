class Contact < ApplicationRecord
  belongs_to :organization
  has_many :portfolios, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def get_summary
    organization = self.organization
    portfolios = self.portfolios.pluck(:performance, :balance)
    perform_arr = []
    balance_arr = []

    portfolios.map{|t| 
      perform_arr << t[0]
      balance_arr << t[1]
    }


    max_performance = perform_arr.map(&:to_f).select(&:positive?).max || perform_arr.map(&:to_f).select(&:negative?).max
    min_performance = perform_arr.map(&:to_f).select(&:negative?).min || perform_arr.map(&:to_f).select(&:positive?).min

    { organization_nm: organization.name, organization_email: organization.try(:email), best: max_performance, worst: min_performance, balance: balance_arr.max }
  end
end
