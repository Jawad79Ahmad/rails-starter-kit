# frozen_string_literal: true

# Devise Confirmable
class DeviseConfirmable < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
    end

    add_index :users, :confirmation_token, unique: true
  end
end