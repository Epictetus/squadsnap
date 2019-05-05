class CreateSquads < ActiveRecord::Migration[5.2]
  def change
    create_table :squads do |t|
      t.string :name
      t.string :sport

      t.timestamps
    end
  end
end
