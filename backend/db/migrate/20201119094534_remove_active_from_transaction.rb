class RemoveActiveFromTransaction < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :active, :boolean
  end
end
