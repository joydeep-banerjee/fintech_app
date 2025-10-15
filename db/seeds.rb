# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ "Acme Corp", "Globex Inc", "Soylent Corp", "Initech" ].each do |org_name|
  Organization.where(name: org_name, email: "#{org_name.downcase.split(" ").first}@example.com").first_or_create!
end

[ "Alice Johnson", "Bob Smith", "Charlie Brown" ].each do |contact_name|
  Contact.where(name: contact_name, email: "#{contact_name.downcase.split(" ").first}@example.com").first_or_create!(organization: Organization.order("RANDOM()").first)
end

[ "Retirement Fund", "Education Savings", "Vacation Fund", "Growth Fund", "Income Fund", "Equity Fund", "Bonds Fund" ].each do |portfolio_title|
  Portfolio.where(title: portfolio_title).first_or_create!(contact: Contact.order("RANDOM()").first, balance: rand(1000..10000), performance: "#{rand(-10..10)}%")
end

EmailTemplate.create(subject: "Monthly Portfolio v01", body: "Hello {{name}},\r\n\r\nBalance: {{balance}}%\r\n\r\n Performance: {{performance}}%")
EmailTemplate.create(subject: "Monthly Portfolio v02", body: "Hello {{name}},\r\n\r\nBalance: {{balance}}%\r\n\r\n Performance: {{performance}}%")
EmailTemplate.create(subject: "Monthly Portfolio v03", body: "Hello {{name}},\r\n\r\nYour organization: {{organization_name}}\r\n\r\nBest portfolio: {{best_performance}}%\r\n\r\nWorst portfolio: {{worst_performance}}%")


