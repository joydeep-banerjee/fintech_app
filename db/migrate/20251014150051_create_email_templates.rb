class CreateEmailTemplates < ActiveRecord::Migration[7.2]
  def change
    create_table :email_templates do |t|
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
