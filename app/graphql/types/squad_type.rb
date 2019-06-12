module Types
  class SquadType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :sport, String, null: false
    field :owner_id, Int, null: false
    field :squads_count, Integer, null: true

    def squads_count
      squads.size
    end
  end
end
