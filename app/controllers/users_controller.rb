class UsersController < ApplicationController
    before_filter :authenticate_user!    
    def index
    end
    
    def new
      @user = User.new
    end
    
    def create
      p "hola"
    end
end
