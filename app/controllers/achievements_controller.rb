class AchievementsController < ApplicationController
  
  def show
    @achievements = Goal.where(completed: true)
  end

end
