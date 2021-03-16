class Question < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}
  belongs_to :user
  has_many :answers, dependent: :destroy
  acts_as_taggable_on :tags

  def asked_by
    user.username
  end

  def answers_count
    answers.size
  end
end
