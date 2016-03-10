class GoalsUsers < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
end
