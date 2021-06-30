class AddAnswersCountToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :answers_count, :integer, :default => 0, :null => false
  end
end
