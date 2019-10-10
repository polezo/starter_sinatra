class CreateRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :riders do |r|
      r.string :name
      r.boolean :has_membership
    end
  end
end
