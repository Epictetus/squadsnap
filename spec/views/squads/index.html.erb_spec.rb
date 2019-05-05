require 'rails_helper'

RSpec.describe "squads/index", type: :view do
  before(:each) do
    assign(:squads, [
      Squad.create!(
        :name => "Name",
        :sport => "Sport"
      ),
      Squad.create!(
        :name => "Name",
        :sport => "Sport"
      )
    ])
  end

  it "renders a list of squads" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sport".to_s, :count => 2
  end
end
