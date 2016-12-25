class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.references :trip, foreign_key: true
      t.string :description
      t.decimal :amount
      t.timestamps
    end
  end
end
