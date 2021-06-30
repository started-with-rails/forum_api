class AddCounterCacheToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :questions_count, :integer, :default => 0, :null => false
    add_column :users, :answers_count, :integer, :default => 0, :null => false
  end
end
