class QuestionsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[ show index  ]
  before_action :set_question, only: %i[ show update destroy ]

 
  def index
    type = Question::QUESTIONS_TYPES.include?(params[:type]) ? params[:type] : Question::QUESTIONS_TYPES.first
    @questions = Question.includes(:user, :answers, taggings: :tag).public_send(:"#{type}")
  end

 
  def show
  end

  
  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      render :show, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  
  def update
    if @question.update(question_params)
      render :show, status: :ok, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  
  def destroy
    @question.destroy
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description, tag_list: [])
    end
end
