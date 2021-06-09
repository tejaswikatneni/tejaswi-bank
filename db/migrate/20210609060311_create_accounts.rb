class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.integer :account_number, index: { unique: true }
      t.decimal :balance, default: 0.0
      t.references :user, null: false, foreign_key: true
      t.text :address

      t.timestamps
    end
  end
end
