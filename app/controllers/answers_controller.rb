class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: %i[ show update destroy ]

  def index
    @answers = @question.answers
  end

  def show
  end

  def create
    @answer = @question.answers.build(answers_params)
    @answer.user = current_user
    if @answer.save
      render :show, status: :created, location: [@question,@answer]
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @answer.update(answers_params)
      render :show, status: :ok, location: [@question,@answer]
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @answer.destroy
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answers_params
    params.require(:answer).permit(:answer)
  end

end
