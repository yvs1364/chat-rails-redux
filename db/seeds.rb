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
  Channel.find_or_create_by(name: chan)
end
puts "#{channels.count} channels created"

channels.each do |channel|
  puts "- #{channel.id}: #{channel.name}"
end

cartman = User.create!(nickname: "cartman".capitalize, email: "cartman@mail.com", password: "password")
stan = User.create!(nickname: "stan".capitalize, email: "stan@mail.com", password: "password")
kyle = User.create!(nickname: "kyle".capitalize, email: "kyle@mail.com", password: "password")
kenny = User.create!(nickname: "kenny".capitalize, email: "kenny@mail.com", password: "password")
puts "#{User.count} users created"

35.times do
  Message.create! user: [cartman, stan, kyle, kenny].sample, channel: channels.sample, content: Faker::TvShows::SouthPark.quote
end
puts "#{Message.count} messages created"
