class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :organization, null: false, foreign_key: true
      t.timestamps
    end
  end
end
