require 'rails_helper'

RSpec.describe "Squads", type: :request do
  describe "GET /api/squads" do
    it "works! (now write some real specs)" do
      get api_squads_path
      expect(response).to have_http_status(200)
    end
  end
end
