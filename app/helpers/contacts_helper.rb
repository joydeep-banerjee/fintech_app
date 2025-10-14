module ContactsHelper
  def get_portfolio_summary(contact)
    portfolios = contact.portfolios.pluck(:performance)
    max_performance = portfolios.map(&:to_f).select(&:positive?).max || portfolios.map(&:to_f).select(&:negative?).max
    min_performance = portfolios.map(&:to_f).select(&:negative?).min || portfolios.map(&:to_f).select(&:positive?).min
    { best: max_performance, worst: min_performance }
  end
end
