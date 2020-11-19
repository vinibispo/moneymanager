class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name
      t.float :initial_value
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.boolean :active

      t.timestamps
    end
  end
end
