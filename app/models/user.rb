class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :username, type: String
  field :password, type: String
  field :token, type: String

  embeds_many :devices
  embeds_many :games

  accepts_nested_attributes_for :devices, :games
  validates :username, uniqueness: { case_sensitive: false }
  validates :token, uniqueness: { case_sensitive: false }
end