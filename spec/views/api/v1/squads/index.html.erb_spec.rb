require 'rails_helper'

RSpec.describe "/api/v1/squads/index", type: :view do

  # Create user for owner_id
  let(:user) { User.create!(name: 'user1', email: 'user1@squadsnap.com', password: '123456', password_confirmation: '123456') }

  before(:each) do
    assign(:squads, [
      Squad.create!(
        :name => "Name",
        :sport => "Sport",
        :owner_id => user.id
      ),
      Squad.create!(
        :name => "Name",
        :sport => "Sport",
        :owner_id => user.id
      )
    ])
  end

  it "renders a list of squads" do
    allow(view).to receive(:current_user).and_return(user)
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sport".to_s, :count => 2
  end
end
