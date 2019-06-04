require 'rails_helper'

RSpec.describe "responsives/index", type: :view do
  before(:each) do
    assign(:responsives, [
      Responsive.create!(
        :name => "Name"
      ),
      Responsive.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of responsives" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
