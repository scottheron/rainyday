class GoalController < ApplicationController
  before_action :is_authenticated?

  def show
    @goals = Goal.where(completed: false)
  end

  def new
    @goal = Goal.new
  end

  def create
    goal = Goal.create(goal_params)
    # goal = @current_user.goals.create(goal_params)
    # goal[place_id] = @current_place
    redirect_to root_path
  end

  def destroy
    @goal = Goal.delete
    redirect_to root_path
  end

  private

  def goal_params
    params_require(:goal).permit(:description)
  end
end
