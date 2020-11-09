require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a doctor's show page" do
    it "I see doctor's info, their hospital, and names of all their patients" do
      hospital = Hospital.create(name: "Super Good Hospital")
      doctor = hospital.doctors.create!(
        name: "Meredith Grey",
        specialty: "General Surgery",
        university: "Harvard University"
      )
      patient_1 = doctor.patients.create!(
        name: "Brian",
        age: 62
      )
      patient_2 = doctor.patients.create!(
        name: "Tim",
        age: 14
      )
      patient_3 = doctor.patients.create!(
        name: "Alex",
        age: 23
      )
      visit "/doctors/#{doctor.id}"

      expect(page).to have_content(doctor.name)
      expect(page).to have_content(doctor.specialty)
      expect(page).to have_content(doctor.university)
      expect(page).to have_content(hospital.name)
      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)
    end
  end
end
