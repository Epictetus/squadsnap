require 'rails_helper'

RSpec.describe "squads/show", type: :view do

  # Create user for owner_id
  let(:user) { User.create!(name: 'user1', email: 'user1@squadsnap.com', password: '123456', password_confirmation: '123456') }

  before(:each) do
    @squad = assign(:squad, Squad.create!(
      :name => "Name",
      :sport => "Sport",
      :owner_id => user.id
    ))

    Member.create!(squad: @squad, user: user, membership: 'owner')

    @members = Member.where(squad: @squad)
  end

  it "renders attributes in <p>" do
    allow(view).to receive(:current_user).and_return(user)
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Sport/)
  end
end
