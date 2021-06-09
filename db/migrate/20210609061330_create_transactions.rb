class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :credit_account_id
      t.integer :debit_account_id
      t.references :account, null: false, foreign_key: true
      t.integer :transaction_type
      t.decimal :amount, default: 0.0
      t.decimal :service_charge, default: 0.0

      t.timestamps
    end
  end
end
