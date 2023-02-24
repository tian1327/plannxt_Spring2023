class PlanModel < ApplicationRecord
    has_many :eventsteps
    accepts_nested_attributes_for :eventsteps
end
