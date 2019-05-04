require 'rails_helper'

RSpec.describe "squads/show", type: :view do
  before(:each) do
    @squad = assign(:squad, Squad.create!(
      :name => "Name",
      :sport => "Sport"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Sport/)
  end
end
