class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :rider_id
      t.integer :bike_id
    end
  end
end
