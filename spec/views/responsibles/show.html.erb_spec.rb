require 'rails_helper'

RSpec.describe "responsibles/show", type: :view do
  before(:each) do
    @responsible = assign(:responsible, Responsible.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
