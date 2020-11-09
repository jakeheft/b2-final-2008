require 'rails_helper'

describe DoctorPatient, type: :model do
  describe 'relationships' do
    it { should belong_to :doctor }
    it { should belong_to :patient }
  end
end
