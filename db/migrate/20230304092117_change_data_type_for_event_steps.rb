class ChangeDataTypeForEventSteps < ActiveRecord::Migration[7.0]
  def change
    remove_column :event_steps, :StartDay
    remove_column :event_steps, :StartTime
    remove_column :event_steps, :EndTime
    remove_column :event_steps, :Break1start
    remove_column :event_steps, :Break1end
    remove_column :event_steps, :Break2start
    remove_column :event_steps, :Break2end
    add_column :event_steps, :StartDay, :date
    add_column :event_steps, :StartTime, :time
    add_column :event_steps, :EndTime, :time
    add_column :event_steps, :Break1start, :time
    add_column :event_steps, :Break1end, :time
    add_column :event_steps, :Break2start, :time
    add_column :event_steps, :Break2end, :time
  end
end
