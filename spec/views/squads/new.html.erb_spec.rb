require 'rails_helper'

RSpec.describe "squads/new", type: :view do
  before(:each) do
    assign(:squad, Squad.new(
      :name => "MyString",
      :sport => "MyString"
    ))
  end

  it "renders new squad form" do
    render

    assert_select "form[action=?][method=?]", squads_path, "post" do

      assert_select "input[name=?]", "squad[name]"

      assert_select "input[name=?]", "squad[sport]"
    end
  end
end
