class CategoriesController < ApplicationController
  skip_before_action :authenticate_request, only: %i[ questions index  ]

	def index
		@categories = Category.active.most_questions.limit(5)
	end

	def questions
		@category = Category.find(params[:id])
    type = Question::QUESTIONS_TYPES.include?(params[:type]) ? params[:type] : Question::QUESTIONS_TYPES.first
		@questions = @category.questions.includes(:user, :answers, taggings: :tag).public_send(:"#{type}")
		render "questions/index"
	end
end
