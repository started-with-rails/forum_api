class PopulateQustionsAnswersCount < ActiveRecord::Migration[6.1]
  def up
    Question.find_each do |question|
      Question.reset_counters(question.id, :answers)
    end
  end
end
