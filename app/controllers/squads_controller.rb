class SquadsController < ApplicationController
  def index
  end

  # reset_db_path is defined in squads_helpers
  #def reset_db
    #Rails.logger.debug("!!! We reached here 1")
    #if [1, 2].include? current_user.id
    #  Rails.logger.debug("!!! Executing reset_db, we are user_id 1 or 2")

    #  [User, Member, Squad].each { |model| model.truncate! }
    #  Rails.application.load_seed
    #  redirect_to api_squads_path, notice: 'Database has been reset.'
    #elsif
    #  Rails.logger.debug("!!! Attempted to reset_db, not user_id 1")
    #  #redirect_to api_squads_path, notice: 'You must be user_id 1 to do that action.'
    #end
  #end
  #helper_method :reset_db
end
