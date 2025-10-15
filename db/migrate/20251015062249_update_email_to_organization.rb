class UpdateEmailToOrganization < ActiveRecord::Migration[7.2]
  def change
    [ "Acme Corp", "Globex Inc", "Soylent Corp", "Initech" ].each do |org_name|
      org = Organization.find_by(name: org_name)
      org.update(email: "#{org_name.downcase.split(" ").first}@example.com") if org.present?
    end
  end
end
