require 'rails_helper'

RSpec.describe "responsives/new", type: :view do
  before(:each) do
    assign(:responsive, Responsive.new(
      :name => "MyString"
    ))
  end

  it "renders new responsive form" do
    render

    assert_select "form[action=?][method=?]", responsives_path, "post" do

      assert_select "input[name=?]", "responsive[name]"
    end
  end
end
