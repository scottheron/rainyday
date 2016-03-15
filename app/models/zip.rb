# Validates the zip code
class Zip < ActiveRecord::Base
  validates :code,
  uniqueness: true
end
