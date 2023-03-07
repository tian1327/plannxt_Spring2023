class PlanModel < ApplicationRecord
    has_many :event_steps, dependent: :destroy
    accepts_nested_attributes_for :event_steps,allow_destroy: true
end
