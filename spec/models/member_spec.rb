require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'Associations' do
    it 'belongs_to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs_to squad' do
      association = described_class.reflect_on_association(:squad)
      expect(association.macro).to eq :belongs_to
      expect(association.options[:dependent]).to eq :destroy
    end
  end
end
