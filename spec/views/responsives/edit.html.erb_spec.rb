require 'rails_helper'

RSpec.describe "responsives/edit", type: :view do
  before(:each) do
    @responsive = assign(:responsive, Responsive.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit responsive form" do
    render

    assert_select "form[action=?][method=?]", responsive_path(@responsive), "post" do

      assert_select "input[name=?]", "responsive[name]"
    end
  end
end
