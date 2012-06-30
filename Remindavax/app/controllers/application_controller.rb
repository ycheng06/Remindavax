class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_patient
  
  private 
  def current_patient
  	@current_patient ||= Patient.find(session[:patient_id]) if session[:patient_id]
  end

end

