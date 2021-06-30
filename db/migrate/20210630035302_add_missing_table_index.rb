class AddMissingTableIndex < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :category_id, :integer
    add_index  :questions, :category_id
    add_index  :categories, :title, :unique => true
  end
end
