# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if(Device.empty?)
  Device.create(name: 'PS3')
  Device.create(name: 'PS4')
  Device.create(name: 'XBOX 360')
  Device.create(name: 'XBOX ONE')
  Device.create(name: 'PC')
end

if(Game.empty?)
  Game.create(name: 'Call of Duty: Modern Warfare', platform: 'PS3')
  Game.create(name: 'Call of Duty: Modern Warfare 2', platform: 'PS3')
  Game.create(name: 'Call of Duty: Ghosts', platform: 'PS3')
  Game.create(name: 'Battlefield 4', platform: 'PS3')
  Game.create(name: 'Thief', platform: 'PS3')
end