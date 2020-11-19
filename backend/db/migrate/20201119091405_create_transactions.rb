class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :title
      t.string :description
      t.float :value
      t.boolean :active

      t.timestamps
    end
  end
end
