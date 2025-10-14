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
  Organization.find_or_create_by!(name: org_name)
end

[ "Alice Johnson", "Bob Smith", "Charlie Brown" ].each do |contact_name|
  Contact.where(name: contact_name, email: "#{contact_name.downcase.split(" ").first}@example.com").first_or_create!(organization: Organization.order("RANDOM()").first)
end

[ "Retirement Fund", "Education Savings", "Vacation Fund", "Growth Fund", "Income Fund", "Equity Fund", "Bonds Fund" ].each do |portfolio_title|
  Portfolio.where(title: portfolio_title, balance: rand(1000..10000), performance: "#{rand(-10..10)}%").first_or_create!(contact: Contact.order("RANDOM()").first)
end

EmailTemplate.create(subject: " Monthly Portfolio v1", body: "Hello {name},\r\n\r\nBalance: {balance}%\r\n\r\n Performance: {performance}%")
EmailTemplate.create(subject: " Monthly Portfolio v2", body: "Hello {name},\r\n\r\nBalance: {balance}%\r\n\r\n Performance: {performance}%")
