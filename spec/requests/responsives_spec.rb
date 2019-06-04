require 'rails_helper'

RSpec.describe "Responsives", type: :request do
  describe "GET /responsives" do
    it "works! (now write some real specs)" do
      get responsives_path
      expect(response).to have_http_status(200)
    end
  end
end
