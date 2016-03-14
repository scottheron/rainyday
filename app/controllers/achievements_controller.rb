class AchievementsController < ApplicationController
  before_action :is_authenticated?
  
  def show
    @achievements = Goal.where(completed: true)
  end

  def destroy
    delete_goal = Goal.find(params[:id])
    redirect_to '/achievements'
  end

end
