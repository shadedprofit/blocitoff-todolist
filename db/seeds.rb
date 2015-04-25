require 'faker'

5.times do 
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: 'helloworld',
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

50.times do 
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end

1.times do
  admin = User.new(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'helloworld',
  )
  admin.skip_confirmation!
  admin.save!
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
