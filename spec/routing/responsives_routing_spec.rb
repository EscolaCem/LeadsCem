require "rails_helper"

RSpec.describe ResponsivesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/responsives").to route_to("responsives#index")
    end

    it "routes to #new" do
      expect(:get => "/responsives/new").to route_to("responsives#new")
    end

    it "routes to #show" do
      expect(:get => "/responsives/1").to route_to("responsives#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/responsives/1/edit").to route_to("responsives#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/responsives").to route_to("responsives#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/responsives/1").to route_to("responsives#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/responsives/1").to route_to("responsives#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/responsives/1").to route_to("responsives#destroy", :id => "1")
    end
  end
end
