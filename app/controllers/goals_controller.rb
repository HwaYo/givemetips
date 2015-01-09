class GoalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
  end

  def new
    @user = current_user
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.writer = current_user
    @goal.save!

    redirect_to @goal
  end

  def show
    @goal = Goal.find(params[:id])
    @url = goal_url(@goal)
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to goals_path
  end

private
  def goal_params
    params.require(:goal).permit(:content)
  end
end
