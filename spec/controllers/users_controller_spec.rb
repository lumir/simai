require 'spec_helper'

describe UsersController do

   before(:all) do
      User.delete_all
   end

   context "create user action" do
      it "should create a new user with valid info" do
         login_as_admin
         role = Factory(:role)
         params = {:user => {:email => "simai@test.com", :username => "simai_user", :password => "123abc", :role_id => role.id}, :confirmation => "123abc"}
         lambda do
           post "create", params
         end.should change(User,:count).by(1)
      end

      it "should not create a new user with invalid info" do
         login_as_admin
         role = Factory(:role)
         params = {:user => {:email => "", :username => "", :password => "", :role_id => role.id}, :confirmation => ""}
         lambda do
           post "create", params
         end.should change(User,:count).by(0)
      end

      it "should not create a new user with existing email" do
         login_as_admin
         role = Factory(:role)
         user = Factory(:user, :email => "simai@test.com", :username => "simai_user2", :password => "123abc", :role_id => role.id)
         params = {:user => {:email => "simai@test.com", :username => "simai_user", :password => "123abc", :role_id => role.id}, :confirmation => "123abc"}
         lambda do
           post "create", params
         end.should change(User,:count).by(0)
      end

   end

   context "destroy user action" do
      it "should destroy an existing user" do
         login_as_admin
         user = Factory(:user)
         lambda do
           delete "destroy", {:id => user.id}
         end.should change(User,:count).by(-1)
      end
   end

end
