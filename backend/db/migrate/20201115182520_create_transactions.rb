class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, :id: :uuid do |t|
      t.string :type
      t.string :string
      t.string :title
      t.float :value
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
