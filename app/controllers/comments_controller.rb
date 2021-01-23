class CommentsController < ApplicationController

    def index
        @comment = Comment.all
    end
    def show
        @comment = Comment.find(params[:id])
        @user = User.find(@comment.user_id)
    end

    def edit
        @comment = Comment.find(params[:id])
    end
    def create
      @user = User.first
      @user_id = @user.id
      @comment = Comment.new(comment_params)
  
      if @comment.save
        redirect_to images_path
      else
        render :new
      end
    end
    def update
      if current_user.admin?
        
        @comment = Comment.find(params[:id])
    
        if @comment.update(comment_params)
          redirect_to @comment
        else
          render :edit
        end
      end

      
    end
    def destroy
      if current_user.admin?

        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to images_path
      end
    end

    private
    def comment_params
      params.require(:comment).permit(:idea, :image_id, :user_id)
    end

end
