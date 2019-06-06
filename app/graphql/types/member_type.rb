module Types
  class MemberType < Types::BaseObject
    field :id, ID, null: false
    field :squad, ID, null: true
    field :user, ID, null: false
    field :membership, String, null: false
  end
end
