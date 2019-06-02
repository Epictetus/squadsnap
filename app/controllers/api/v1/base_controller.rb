class Api::V1::BaseController < ApplicationController
  respond_to :json

  before_action :authorize_user!

  private
    def authorize_user!
      if !current_user
        redirect_to login_path, notice: "You must be logged in to access to this page"
      end
    end
end
