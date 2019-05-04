require "rails_helper"

RSpec.describe SquadsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/squads").to route_to("squads#index")
    end

    it "routes to #new" do
      expect(:get => "/squads/new").to route_to("squads#new")
    end

    it "routes to #show" do
      expect(:get => "/squads/1").to route_to("squads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/squads/1/edit").to route_to("squads#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/squads").to route_to("squads#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/squads/1").to route_to("squads#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/squads/1").to route_to("squads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/squads/1").to route_to("squads#destroy", :id => "1")
    end
  end
end
