require "rails_helper"

RSpec.describe Api::V1::SquadsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "api/squads").to route_to("api/v1/squads#index")
    end

    it "routes to #new" do
      expect(:get => "api/squads/new").to route_to("api/v1/squads#new")
    end

    it "routes to #show" do
      expect(:get => "api/squads/1").to route_to("api/v1/squads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "api/squads/1/edit").to route_to("api/v1/squads#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "api/squads").to route_to("api/v1/squads#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "api/squads/1").to route_to("api/v1/squads#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "api/squads/1").to route_to("api/v1/squads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "api/squads/1").to route_to("api/v1/squads#destroy", :id => "1")
    end
  end
end
