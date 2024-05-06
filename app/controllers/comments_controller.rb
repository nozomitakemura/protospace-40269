class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to prototype_comments_path
    else
      @comment = Comment.find(params[:id])
      render :show, status: :unprocessable_entity
    end
  end

private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
