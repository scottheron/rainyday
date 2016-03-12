class Zip < ActiveRecord::Base
  validates :code,
  uniqueness: true
end
