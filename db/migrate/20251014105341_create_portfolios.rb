class CreatePortfolios < ActiveRecord::Migration[7.2]
  def change
    create_table :portfolios do |t|
      t.string :title, null: false
      t.integer :balance, null: false, default: 0
      t.string :performance, null: false, default: "0%"
      t.references :contact, null: false, foreign_key: true
      t.timestamps
    end
  end
end
