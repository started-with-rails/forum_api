class Question < ApplicationRecord
  validates :title, presence: true, length: {maximum: 5}
  validates :description, presence: true, length: {maximum: 10}
  belongs_to :user
  has_many :answers, dependent: :destroy


  def asked_by
    user.username
  end

  def answers_count
    answers.size
  end
end
