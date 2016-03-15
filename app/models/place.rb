# Place table is linked to Goals table and each place can have many goals
class Place < ActiveRecord::Base
  has_many :goals
end
