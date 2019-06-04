require 'rails_helper'

RSpec.describe "responsives/show", type: :view do
  before(:each) do
    @responsive = assign(:responsive, Responsive.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
