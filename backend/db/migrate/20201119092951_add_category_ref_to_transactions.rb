class AddCategoryRefToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :category, null: false, foreign_key: true, type: :uuid
  end
end
