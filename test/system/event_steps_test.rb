require "application_system_test_case"

class EventStepsTest < ApplicationSystemTestCase
  setup do
    @event_step = event_steps(:one)
  end

  test "visiting the index" do
    visit event_steps_url
    assert_selector "h1", text: "Event steps"
  end

  test "should create event step" do
    visit event_steps_url
    click_on "New event step"

    fill_in "Breaktime", with: @event_step.BreakTime
    fill_in "Endtime", with: @event_step.EndTime
    fill_in "Num", with: @event_step.Num
    fill_in "Startday", with: @event_step.StartDay
    fill_in "Starttime", with: @event_step.StartTime
    fill_in "Plan model", with: @event_step.plan_model_id
    click_on "Create Event step"

    assert_text "Event step was successfully created"
    click_on "Back"
  end

  test "should update Event step" do
    visit event_step_url(@event_step)
    click_on "Edit this event step", match: :first

    fill_in "Breaktime", with: @event_step.BreakTime
    fill_in "Endtime", with: @event_step.EndTime
    fill_in "Num", with: @event_step.Num
    fill_in "Startday", with: @event_step.StartDay
    fill_in "Starttime", with: @event_step.StartTime
    fill_in "Plan model", with: @event_step.plan_model_id
    click_on "Update Event step"

    assert_text "Event step was successfully updated"
    click_on "Back"
  end

  test "should destroy Event step" do
    visit event_step_url(@event_step)
    click_on "Destroy this event step", match: :first

    assert_text "Event step was successfully destroyed"
  end
end
