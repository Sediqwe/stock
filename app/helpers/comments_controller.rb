class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment
    else
      render :new
    end
  end
  
  def destroy
  end

  def show
  end

  def update
  end

  private
  def comment_params
    params.require(:comment).permit(:idea, :user_id, :image_id)
  end
end
