class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.references :employee, foreign_key: true
      t.string :destiny
      t.date :begin_date
      t.date :end_date
      t.timestamps
    end
  end
end
