require 'rails_helper'

describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe '#instance methods' do
    it 'doc_count' do
      hospital = Hospital.create!(name: "Super Good Hospital")
      hospital_2 = Hospital.create!(name: "Less Good Hospital")
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
      doctor_4 = hospital_2.doctors.create!(
        name: "Dr. Chuckles",
        specialty: "Malpractice",
        university: "Clown College"
      )

      expect(hospital.doc_count).to eq(3)
    end
  end
end
