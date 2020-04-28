# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Message.destroy_all
User.destroy_all
Channel.destroy_all
puts "everything is destroyed"

chans = %w(general marseille react)

channels = chans.map do |chan|
  Channel.create(name: chan)
end
puts "#{channels.count} channels created"


yvs = User.create!(nickname: "yvs", email: "yvan@mail.com", password: "password")
rosie = User.create!(nickname: "rosie", email: "rosie@mail.com", password: "password")
puts "#{User.count} users created"

30.times do
  Message.create! user: [yvs, rosie].sample, channel: channels.sample, content: Faker::TvShows::SouthPark.quote
end
puts "#{Message.count} messages created"
