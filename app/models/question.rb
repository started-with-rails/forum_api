class Question < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}
  belongs_to :user
  has_many :answers, dependent: :destroy
  acts_as_taggable_on :tags
  QUESTIONS_TYPES = %w(recent popular unanswered answered)


  scope :recent, -> { order(created_at: :desc)}
  scope :popular, -> { order(answers_count: :desc).recent }
  scope :unanswered, -> { where(answers_count: [nil,0]).recent }
  scope :answered, -> { where.not(answers_count: [nil,0]).popular }


  # class << self
  #   QUESTIONS_TYPES.each do |QUESTIONS_TYPE|
  #     define_method "#{QUESTIONS_TYPE}" do |type|
      
  #     end
  #   end
  # end

  def asked_by
    user.username
  end

  def answers_count
    answers.size
  end
end
