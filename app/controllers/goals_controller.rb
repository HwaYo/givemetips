class GoalsController < ApplicationController
  def new
    @user = current_user
  end
end
