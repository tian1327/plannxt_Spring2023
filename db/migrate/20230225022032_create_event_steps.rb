class CreateEventSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :event_steps do |t|
      t.string :Num
      t.string :StartDay
      t.string :StartTime
      t.string :EndTime
      t.string :BreakTime
      t.references :plan_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
