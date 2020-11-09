class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.where('doctor_id = ?', params[:doctor_id]).where('patient_id = ?', params[:patient_id]).first
    doctor_patient.destroy!
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end
