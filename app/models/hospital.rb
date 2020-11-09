class Hospital < ApplicationRecord
  has_many :doctors

  def doc_count
    Doctor.where('hospital_id = ?', id).count
  end

  def unique_universities
    Doctor.where('hospital_id = ?', id).distinct.pluck('doctors.university')
  end
end
