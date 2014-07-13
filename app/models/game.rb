class Game
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :platform, type: String

  validates :name, presence: true
  validates :platform, presence: true
end
