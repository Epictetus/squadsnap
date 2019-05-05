require 'rails_helper'

RSpec.describe "squads/edit", type: :view do
  before(:each) do
    @squad = assign(:squad, Squad.create!(
      :name => "MyString",
      :sport => "MyString"
    ))
  end

  it "renders the edit squad form" do
    render

    assert_select "form[action=?][method=?]", squad_path(@squad), "post" do

      assert_select "input[name=?]", "squad[name]"

      assert_select "input[name=?]", "squad[sport]"
    end
  end
end
