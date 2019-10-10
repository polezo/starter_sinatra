class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |b|
      b.string :color
      b.datetime :date_introduced
      b.float :miles
    end
  end
end
