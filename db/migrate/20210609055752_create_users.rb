class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: { unique: true }
      t.string :identification_number, index: { unique: true }
      t.string :mobile_number
      t.date :dob

      t.timestamps
    end
  end
end
