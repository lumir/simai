class UsersController < ApplicationController
    before_filter do
      authorization_required(current_user)
      #:authenticate_user!
    end


    def index
      @users = User.all
    end

    def new
      @user = User.new(:confirmation => "")
      @roles = Role.all.collect {|role| [role.title, role.id]}
    end

    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(params[:user])
      @user.username = params[:user][:username]
      @user.role_id = params[:user][:role_id]
      val_conf = @user.validate_confirmation(params[:confirmation])
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

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.username = params[:user][:username]
      val_conf = params[:user][:password] == params[:confirmation] ? true :  false
      if @user.update_attributes(params[:user]) and val_conf
        flash[:notice] = "User updated successfully"
        redirect_to :controller => "home", :action => "index"
      else
        flash[:error] = "Error adding the user: #{@user.errors.full_messages.to_sentence}" unless @user.errors.blank?
        flash[:error] = "Error adding the user: Validation password error" if @user.errors.blank?
        render :action => 'edit'
      end
    end

    def destroy
      @user = User.find(params[:id])
      @id = @user.id
      if @user.destroy
        flash[:notice] = "User deleted successfully"
        respond_to do |wants|
          wants.js
        end
      end
    end
end
