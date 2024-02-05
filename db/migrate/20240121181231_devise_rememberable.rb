# frozen_string_literal: true

# Devise Rememberable
class DeviseRememberable < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.datetime :remember_created_at
    end
  end
end
