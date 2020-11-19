class RemoveDateFromCategory < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :date, :date
  end
end
