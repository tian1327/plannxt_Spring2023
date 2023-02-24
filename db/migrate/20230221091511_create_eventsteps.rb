class CreateEventsteps < ActiveRecord::Migration[7.0]
  def change
    create_table :eventsteps do |t|
      t.references :plan_model, null: false, foreign_key: true
      t.string :name
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time

      t.timestamps
    end
  end
end
