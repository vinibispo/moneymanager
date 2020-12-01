# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
