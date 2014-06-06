class Game < ActiveRecord::Base
  belongs_to :user
  validates :name
  validates :platform
end
