# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Criandos os usuarios'

begin
  user = Usuario.create :nome => 'Igor Rocha', :email => 'igor@gmail.com', :password => 'testeteste', :password_confirmation => 'testeteste', :username => 'igor'
  puts 'New user created: ' << user.username

  user = Usuario.create :nome => 'Rodolfo Sikora', :email => 'sikora@gmail.com', :password => 'p0o9i8u7', :password_confirmation => 'p0o9i8u7', :username => 'sikora'
  puts 'New user created: ' << user.username
rescue ActiveRecord::RecordInvalid => invalid
  puts invalid.record.errors.full_messages
end
