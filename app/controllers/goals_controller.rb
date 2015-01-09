class GoalsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:new, :show, :random_show]

  def index
    if user_signed_in?
      @goals = current_user.goals
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
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
    @user = @goal.writer
    @url = goal_url(@goal)
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to goals_path
  end

  def random_show
    if Goal.count >= 1
      rand_id = Random.rand(1..Goal.count)
      redirect_to goal_path(id: rand_id)
    else
      redirect_to root_path
    end
  end

private
  def goal_params
    params.require(:goal).permit(:content)
  end
end
