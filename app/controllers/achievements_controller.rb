class AchievementsController < ApplicationController
  before_action :is_authenticated?, except: [:index]
  
  def show
    @achievements = Goal.where(completed: true)
  end

end
