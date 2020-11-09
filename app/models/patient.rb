class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.age_sorted
    Patient.order('age DESC')
  end
end
