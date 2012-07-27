class SettingsController < ApplicationController

  def edit 
    @setting = Setting.find_or_create_by_patient_id(current_patient.id,
                                                    :send_by_text => false,
                                                    :send_by_email => false,
                                                    :reminder_summary => false,
                                                    :reminder_preferred_times => false,
                                                    :is_active => false)
  end

  def update 
    @setting = Setting.find_by_patient_id(current_patient.id)
    if @setting.update_attributes(params[:setting])

      redirect_to settings_path
      #using redirect_to makes an extra call and
      #produces extra overhead. We need to change this later.
      #using this would be better:
      #render "edit", :flash => "Settings saved!"
     
    else
      render "edit", :alert => "Settings failed to save!"
    end
  end

end
