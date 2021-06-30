class Answer < ApplicationRecord
  validates :answer, presence: true, length: {minimum: 5}
  belongs_to :user, counter_cache: true
  belongs_to :question,counter_cache: true
  acts_as_votable cacheable_strategy: :update_columns
 
  def answered_by
    user.username
  end

end
