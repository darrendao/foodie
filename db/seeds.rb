# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Role.find_or_create_by_name('SuperAdmin')
admin.save
user = User.find_or_create_by_username('admin', :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
user.roles |= [admin]
user.save

establishment_owner = Role.find_or_create_by_name('EstablishmentOwner')
establishment_owner.save
user = User.find_or_create_by_username('owner1', :email => 'owner1@example.com', :password => 'password', :password_confirmation => 'password')
user.roles |= [establishment_owner]
user.save

columnist = Role.find_or_create_by_name('Columnist')
columnist.save
user = User.find_or_create_by_username('columnist1', :email => 'columnist1@example.com', :password => 'password', :password_confirmation => 'password')
user.roles |= [columnist]
user.save

multirole_user = User.find_or_create_by_username('multirole1', :email => 'multirole1@example.com', :password => 'password', :password_confirmation => 'password')
multirole_user.roles |= [columnist, establishment_owner]

# Now create some restaurant
(1..10).each do |i|
  res = Establishment.find_or_create_by_name("Restaurant #{i}", :website => "http://restaurant#{i}.food")
  res.save
end
