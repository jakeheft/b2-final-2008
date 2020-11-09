class Hospital < ApplicationRecord
  has_many :doctors

  def doc_count
    Doctor.where('hospital_id = ?', id).count
  end
end
