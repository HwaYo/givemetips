class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    goal = Goal.find(params[:goal_id])
    comment = goal.comments.build(comment_params)
    if current_user == goal.writer
      comment.writer = current_user
    end

    comment.save!

    redirect_to goal
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end