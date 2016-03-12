class Zip < ActiveRecord::Base
  validates :zip,
  uniqueness: true
end
