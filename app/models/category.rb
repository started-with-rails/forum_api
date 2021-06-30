class Category < ApplicationRecord
	has_many :questions
	validates :title, presence: true, uniqueness: true
	scope :active, -> { where(status: true) }
	scope :most_questions, -> { order(questions_count: :desc) }
end
