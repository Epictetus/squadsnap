require 'rails_helper'

RSpec.describe "squads/edit", type: :view do

  # Create user for owner_id
  let(:user) { User.create!(name: 'user1', email: 'user1@squadsnap.com', password: '123456', password_confirmation: '123456') }

  before(:each) do
    @squad = assign(:squad, Squad.create!(
      :name => "Name",
      :sport => "Sport",
      :owner_id => user.id
    ))

    Member.create!(squad: @squad, user: user, membership: 'owner')
  end

  it "renders the edit squad form" do
    allow(view).to receive(:current_user).and_return(user)
    render
    assert_select "form[action=?][method=?]", squad_path(@squad), "post" do
      assert_select "input[name=?]", "squad[name]"
      assert_select "input[name=?]", "squad[sport]"
    end
  end
end
