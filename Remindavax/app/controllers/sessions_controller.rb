class SessionsController < ApplicationController

def new 
end

def create 
	patient = Patient.authenticate(params[:email], params[:password])
	if patient
		session[:patient_id] = patient.id 
		redirect_to drugs_url, :notice => "Logged in"
	else
		flash.now.alert = "Invalid email or password"
		render "new"
	end
end

def destroy 
	session[:patient_id] = nil 
	redirect_to root_url, :notice => "Logged out!"
end

end