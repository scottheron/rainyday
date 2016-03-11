class AchievementsController < ApplicationController
  
  def show
    puts '----------------------'
    puts @current_user.id
    puts '----------------------'

    @achievements = Goal.where(completed: true)
    puts '----------------------'
    puts @achievements.find_by(user_id: @current_user.id)
    puts '----------------------'
    # @achievement = goal.where( completed: true)
  end

end
