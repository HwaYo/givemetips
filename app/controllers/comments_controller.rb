class CommentsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def create
  end

  def update
  end

  def destroy
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end