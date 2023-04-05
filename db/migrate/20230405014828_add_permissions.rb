class AddPermissions < ActiveRecord::Migration[7.0]
  def change
    add_column :plan_models, :viewers, :integer, array: true, default: []
    add_column :plan_models, :editors, :integer, array: true, default: []
    add_column :plan_models, :public, :boolean,  default: false
    add_column :users, :enabled, :boolean,  default: true
  end
end
