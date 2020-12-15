# frozen_string_literal: true

class CreateUserTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tokens, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :token
      t.timestamps
    end
  end
end
