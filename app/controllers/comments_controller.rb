class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(model_params)
    @comment.save
  end

  private

  def model_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :comment)
  end
end
