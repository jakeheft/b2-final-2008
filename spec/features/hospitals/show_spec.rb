require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a hospital's show page" do
    it "I see its name, number of its doctors, unique doctors universities" do
      hospital = Hospital.create!(name: "Super Good Hospital")
      doctor_1 = hospital.doctors.create!(
        name: "Meredith Grey",
        specialty: "General Surgery",
        university: "Harvard University"
      )
      doctor_2 = hospital.doctors.create!(
        name: "Jack Kevorkian",
        specialty: "Pathology",
        university: "Harvard University"
      )
      doctor_3 = hospital.doctors.create!(
        name: "Chris Turk",
        specialty: "General Surgery",
        university: "William & Mary University"
      )
      visit "/hospitals/#{hospital.id}"
save_and_open_page
      expect(page).to have_content(hospital.name)
      expect(page).to have_content(hospital.doc_count)
      expect(page).to have_content(doctor_1.university)
      expect(page).to have_content(doctor_3.university)
    end
  end
end
