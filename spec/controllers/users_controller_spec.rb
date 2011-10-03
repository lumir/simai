require 'spec_helper'

describe UsersController do

   context "create user action" do
      it "should create a new user with valid info" do
         user = Factory(:user, :username => "vander")
         user.stub!(:validate_confirmation).and_return(true)
         params = {:user => user}
      end
   end

end
