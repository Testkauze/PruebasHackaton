class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.  #Probando otra configuracion
  protect_from_forgery with: :exception
end
