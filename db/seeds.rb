# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#CREATE USER ROLES
roles = ["Admin","Plant Boss","Maintainance Boss", "Operator"]
roles.each do |title|
  r = Role.new(:title => title)
  r.save
  p r.title + " role was saved succesffully"
end


#CREATE DEFAULT ADMIN USER
role_admin = Role.find_by_title("Admin")
default_admin = User.find_or_initialize_by_email(
  :email => "simai@simai.com",
  :password => "holanda1")
default_admin.username = "simaiadmin"
default_admin.role_id = role_admin.id
if default_admin.save!
  p "Admin generated successfully"
else
  p "Something was wrong creating admin"
end

