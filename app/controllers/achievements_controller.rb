class AchievementsController < ApplicationController
  
  def show
    @achievements = Goal.where(completed: true)

    puts '----------------------'
    puts @achievements[1].description
    puts '----------------------'
    # @achievement = goal.where( completed: true)
  end

end
