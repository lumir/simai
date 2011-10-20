namespace :test_info do
   task :load_all => ['role_bundles:load_defaults', 'test_data:add_test_users', 'test_data:load_affiliations', 'test_data:load_staff_affiliations', 'test_data:load_insurance_companies', 'test_data:load_referrals']

   desc "Add test admin users"
   task :load_admin_users => :environment do
      role = Role.find_by_title("Admin")
      role = Role.new(:title => "Admin") unless role
      20.times do |n|
         #debugger
         u = User.new()
         u.email = "user_#{n}@simai.com"
         u.username = "user_#{n}"
         u.password = "simai123"
         u.role_id = role.id
         if u.save
            p "Admin user User_#{u.username} created succesfully"
         else
            p "Error creating the admin user #{u.username}: #{u.errors}"
         end
      end
   end

end
