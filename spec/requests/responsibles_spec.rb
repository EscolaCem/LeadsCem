require 'rails_helper'

RSpec.describe "Responsibles", type: :request do
  describe "GET /responsibles" do
    it "works! (now write some real specs)" do
      get responsibles_path
      expect(response).to have_http_status(200)
    end
  end
end
