class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    goal = Goal.find(params[:goal_id])
    comment = goal.comments.build(comment_params)
    comment.like = 0
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

  def like
    @comment = Comment.find(params[:comment_id])
    @comment.like += 1

    @comment.save!

    redirect_to :back
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end