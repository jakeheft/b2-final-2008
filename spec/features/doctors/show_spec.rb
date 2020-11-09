require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a doctor's show page" do
    before(:each) do
      @hospital = Hospital.create(name: "Super Good Hospital")
      @doctor = @hospital.doctors.create!(
        name: "Meredith Grey",
        specialty: "General Surgery",
        university: "Harvard University"
      )
      @patient_1 = @doctor.patients.create!(
        name: "Brian",
        age: 62
      )
      @patient_2 = @doctor.patients.create!(
        name: "Tim",
        age: 14
      )
      @patient_3 = @doctor.patients.create!(
        name: "Alex",
        age: 23
      )
      visit "/doctors/#{@doctor.id}"
    end

    it "I see doctor's info, their hospital, and names of all their patients" do
      expect(page).to have_content(@doctor.name)
      expect(page).to have_content(@doctor.specialty)
      expect(page).to have_content(@doctor.university)
      expect(page).to have_content(@hospital.name)
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)
    end

    describe 'Next to each patients name I see a button to remove that patient' do
      it "When I remove patient I'm brought back to dr show page and patient is gone" do
        within "#patient-#{@patient_1.id}" do
          click_button "Remove Patient"
        end
        expect(current_path).to eq("/doctors/#{@doctor.id}")
        expect(page).to_not have_content(@patient_1.name)
      end

      it "When I remove my patient who also belongs to another dr, that patient still belongs to the other doctor" do
        doctor_2 = @hospital.doctors.create(
          name: "Chris Turk",
          specialty: "General Surgery",
          university: "William & Mary University"
        )
        doctor_2.patients << @patient_1

        expect(@doctor.patients).to eq([@patient_1, @patient_2, @patient_3])
        expect(doctor_2.patients).to eq([@patient_1])

        within "#patient-#{@patient_1.id}" do
          click_button "Remove Patient"
        end

        @doctor.reload

        expect(@doctor.patients).to eq([@patient_2, @patient_3])
        expect(doctor_2.patients).to eq([@patient_1])
      end
    end
  end
end
