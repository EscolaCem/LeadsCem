require 'rails_helper'

RSpec.describe "responsibles/index", type: :view do
  before(:each) do
    assign(:responsibles, [
      Responsible.create!(
        :name => "Name"
      ),
      Responsible.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of responsibles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
