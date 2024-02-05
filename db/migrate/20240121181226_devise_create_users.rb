# frozen_string_literal: true

# Devise Users
class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username,           null: false
      t.string :email,              null: true
      t.string :phone_number,       null: true
      t.integer :gender
      t.date :dob
      t.string :encrypted_password, null: false

      t.timestamps null: false
    end
  end
end
