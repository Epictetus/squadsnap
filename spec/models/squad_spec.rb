require 'rails_helper'

RSpec.describe User, type: :model do

  # Create user
  let(:user) { User.create!(name: 'user1', email: 'user1@squadsnap.com', password: '123456', password_confirmation: '123456') }


  context 'Associations' do
    it 'has_many members' do
      association = described_class.reflect_on_association(:members)
      expect(association.macro).to eq :has_many
    end

    it 'has_many squads' do
      association = described_class.reflect_on_association(:squads)
      expect(association.macro).to eq :has_many
      expect(association.options[:through]).to eq :members
    end
  end

  context 'Validations' do
    it 'is a valid user' do
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user.email = nil
      expect(user).not_to be_valid
    end

    it "is not valid with an invalid email format" do
      user.email = 'testtest.com'
      expect(user).not_to be_valid
    end

    it "is not valid without a password" do
      user.password = nil
      expect(user).not_to be_valid
    end

    it "is not valid with an unmatching password confirmation" do
      user.password = '123456'
      user.password_confirmation = '654321'
      expect(user).not_to be_valid
    end
  end

  #context 'Methods' do

  #end

end
