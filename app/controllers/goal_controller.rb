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
    Goal.find(params[:format]).delete
    flash[:success] = "Entry has been deleted"
    redirect_to goal_path
  end

  def update
    complete = Goal.find(params[:format])
    complete.update(completed: true)
    flash[:success] = "Task completed and added to your achievements. I knew you could do it!"
    redirect_to goal_path
  end

  private

  def goal_params
    # params_require(:goal).permit(:description)
  end

end
