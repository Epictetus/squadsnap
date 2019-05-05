class AddOwnerToSquads < ActiveRecord::Migration[5.2]
  def change
    add_reference :squads, :owner, index: true, foreign_key: { to_table: :users }
  end
end
