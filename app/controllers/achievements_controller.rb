class AchievementsController < ApplicationController
  before_action :is_authenticated?
  
  def show
    @achievements = Goal.where(completed: true)
  end

end
