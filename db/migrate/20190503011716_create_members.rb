class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :user, foreign_key: true
      t.string :position
      t.string :number
      t.string :membership # ie owner, manager, member

      t.timestamps
    end
  end
end
