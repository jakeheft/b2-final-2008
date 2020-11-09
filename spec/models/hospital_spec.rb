require 'rails_helper'

describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end
end
