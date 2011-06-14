class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  protect_from_forgery
  helper_method :allowed_to_admin_authorized?, :allowed_to_plant_boss_authorized?
end
