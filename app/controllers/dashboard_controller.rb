class DashboardController < ApplicationController
  def index
    @squads = Squad.all
  end
end
