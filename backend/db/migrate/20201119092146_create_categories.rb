class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :title
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
