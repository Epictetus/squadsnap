module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    ############################################################################
    # Users
    ############################################################################
    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    ############################################################################
    # Squads
    ############################################################################
    field :squads, [Types::SquadType], null: false

    def squads
      Squad.all
    end

    field :squad, Types::SquadType, null: false do
      argument :id, ID, required: false
    end

    def squad(id:)
      Squad.find(id)
    end

    field :squad, Types::SquadType, null: false do
      argument :name, String, required: false
    end

    def squad(name:)
      Squad.find(name)
    end

    ############################################################################
    # Members
    ############################################################################
    field :members, [Types::MemberType], null: false

    def members
      Member.all
    end

    field :members, [Types::MemberType], null: false do
      argument :squad, ID, required: true
    end

    def members(squad:)
      Member.where(squad: @squad)
    end

# query {
#  users {
#    name
#  }
# }

# doesnt work
# query {
#  members(squad: 1) {
#    user
#    squad
#    membership
#  }
#}

#query {
#  squads {
#    name
#    sport
#  }
#}


  end
end
