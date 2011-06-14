module AuthenticatedSystem
  protected
    def logged_in?
      !!current_user
    end

    def allowed_to_plant_boss_authorized?
      logged_in? && (current_user.role.title == "Plant Boss")
    end

    def allowed_to_admin_authorized?
      logged_in? && (current_user.role.title == "Admin")
    end

    def admin_required
      return anon_access_denied unless logged_in?
      return access_denied unless allowed_to_admin_authorized?
      true
    end

    def plant_boss_required
      return anon_access_denied unless logged_in?
      return access_denied unless allowed_to_plant_boss_authorized?
      true
    end

    def authorization_required(user)
      if logged_in?
        if user.role.title == "Admin"
          return true
        else
          return access_denied
        end
      else
        return anon_access_denied
      end
    end

    def anon_access_denied
      flash[:error] = "You must be logged in to access that page."
      redirect_to root_url
    end

    def access_denied
      flash[:error] = "You do not have permission to access that page."
      redirect_to root_url
    end

end