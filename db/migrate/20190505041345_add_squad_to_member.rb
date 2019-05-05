class AddSquadToMember < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :squad, index: true, foreign_key: true
  end
end
