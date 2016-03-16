# Goal controller handles CRUD for users goals
class GoalController < ApplicationController
  before_action :is_authenticated?
  def show
    @goals = Goal.where(completed: false)
    @user_goals = Goal.where(user_id: @current_user.id, completed: false)
  end
  def new
    @place = Place.find(params[:id])
    @goal = Goal.new
    @user = User.find(@current_user[:id])
  end
  def create
    goal = Goal.create(goal_params)
    redirect_to goal_path
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
    params.require(:goal).permit(:description, :completed, :place_id, :user_id)
  end
end
