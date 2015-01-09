class GoalsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:new, :show]

  def index
  end

  def new
    @user = User.new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.save!

    redirect_to @goal
  end

  def show
    @goal = Goal.find(params[:id])
    # @user = @goal.user
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
