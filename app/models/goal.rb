# Goal table is linked to Place and User tables
class Goal < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
end
