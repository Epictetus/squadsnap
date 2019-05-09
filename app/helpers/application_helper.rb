require 'navigation_helper.rb'
#require 'squads_helper.rb'

module ApplicationHelper
  include NavigationHelper # NavigationHelper helper methods are available across the whole app.
  include PostsHelper # The post_format_partial_path helper method won’t be available in the home page, because we render posts inside the home page’s template, which belongs to a different controller. To have an access to this method, inside the home page's template, include PostsHelper here

  include SquadsHelper # The squads_partial_path helper method won't be available in home page, because we render posts inside the home page’s template, which belongs to a different controller. To have an access to this method, inside the home page's template, include SquadsHelper here
end
