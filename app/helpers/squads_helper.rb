module SquadsHelper

  def squads_partial_path
    # TODO: if user is not a member of any teams, display create new squad
    #Squads.empty? ? 'squads/form' : 'shared/empty_partial'
    'squads/form'
  end

end
