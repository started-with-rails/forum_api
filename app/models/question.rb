class Question < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}
  belongs_to :user, counter_cache: true
  belongs_to :category, counter_cache: true
  has_many :answers, dependent: :destroy
  acts_as_taggable_on :tags
  QUESTIONS_TYPES = %w(recent most_responses unanswered recently_answered)


  scope :recent, -> { order(created_at: :desc)}
  scope :unanswered, -> { where(answers_count: 0).recent }
  scope :answered, -> { where.not(answers_count: 0) }
  scope :recently_answered, -> { answered.order("answers.created_at DESC") }
  scope :most_responses, -> {  answered.order(answers_count: :desc) }


  

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

  def category_title
    category.title
  end
end
