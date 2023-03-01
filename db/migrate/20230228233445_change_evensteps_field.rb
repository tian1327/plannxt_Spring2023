class ChangeEvenstepsField < ActiveRecord::Migration[7.0]
  def change 
    remove_column :event_steps, :BreakTime
    add_column :event_steps, :Break1start, :string
    add_column :event_steps, :Break1end, :string
    add_column :event_steps, :Break2start, :string
    add_column :event_steps, :Break2end, :string
  end
end
