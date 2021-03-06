require 'rails_helper'

describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe ".class methods" do
    it 'age_sorted' do
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

      expect(Patient.age_sorted).to eq([patient_1, patient_3, patient_2])
    end
  end
end
