# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_609_061_330) do
  create_table 'accounts', force: :cascade do |t|
    t.integer 'account_number'
    t.decimal 'balance', default: '0.0'
    t.integer 'user_id', null: false
    t.text 'address'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['account_number'], name: 'index_accounts_on_account_number', unique: true
    t.index ['user_id'], name: 'index_accounts_on_user_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.integer 'credit_account_id'
    t.integer 'debit_account_id'
    t.integer 'account_id', null: false
    t.integer 'transaction_type'
    t.decimal 'amount', default: '0.0'
    t.decimal 'service_charge', default: '0.0'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['account_id'], name: 'index_transactions_on_account_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'identification_number'
    t.string 'mobile_number'
    t.date 'dob'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['identification_number'], name: 'index_users_on_identification_number', unique: true
  end

  add_foreign_key 'accounts', 'users'
  add_foreign_key 'transactions', 'accounts'
end
