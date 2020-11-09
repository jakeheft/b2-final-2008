require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a patients index page" do
    it "I see the names of all patients listed from oldest to youngest" do
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

      visit '/patients'

      expect(page.all('li')[0]).to have_content(patient_1.name)
      expect(page.all('li')[1]).to have_content(patient_3.name)
      expect(page.all('li')[2]).to have_content(patient_2.name)
    end
  end
end
