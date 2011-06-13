class UsersController < ApplicationController
    before_filter :authenticate_user!
    def index
    end

    def new
      @user = User.new(:confirmation => "")
    end

    def create
      @user = User.new(params[:user])
      @user.username = params[:user][:username]
      p @user
      val_conf = @user.validate_confirmation(params[:confirmation])
      p val_conf
      if @user.valid? and val_conf
        @user.save
        flash[:notice] = "User added successfully"
        redirect_to :controller => "home", :action => "index"
      else
        flash[:error] = "Error adding the user: #{@user.errors.full_messages.to_sentence}" unless @user.errors.blank?
        flash[:error] = "Error adding the user: Validation password error" if @user.errors.blank?
        render :action => 'new'
      end
    end
end
