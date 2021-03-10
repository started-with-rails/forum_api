class TagsController < ApplicationController
  
  def show
  end

  def create
    @tag = Tag.find_or_create_by(title: params[:tag][:title])
    if @tag.save
      render :show, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:title)
  end
end
