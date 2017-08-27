# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['super_admin', 'admin', 'user'].each do |role_name|
	Role.create(name: role_name)
end


u = User.find_or_create_by_email('arunajasmine@gmail.com')
u.first_name = 'Aruna'
u.last_name = 'C'
u.password='Welcome2017'
u.roles<<Role.find_by_name('super_admin')
u.save


