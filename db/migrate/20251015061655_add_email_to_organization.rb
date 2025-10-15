class AddEmailToOrganization < ActiveRecord::Migration[7.2]
  def change
    add_column :organizations, :email, :string
  end
end
