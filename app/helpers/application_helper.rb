require 'navigation_helper.rb'
require 'squads_helper.rb'

module ApplicationHelper
  include NavigationHelper # NavigationHelper helper methods are available across the whole app.
  include SquadsHelper # Include reset_db_path
end
