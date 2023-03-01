require "test_helper"

class EventStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_step = event_steps(:one)
  end

  test "should get index" do
    get event_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_event_step_url
    assert_response :success
  end

  test "should create event_step" do
    assert_difference("EventStep.count") do
      post event_steps_url, params: { event_step: { BreakTime: @event_step.BreakTime, EndTime: @event_step.EndTime, Num: @event_step.Num, StartDay: @event_step.StartDay, StartTime: @event_step.StartTime, plan_model_id: @event_step.plan_model_id } }
    end

    assert_redirected_to event_step_url(EventStep.last)
  end

  test "should show event_step" do
    get event_step_url(@event_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_step_url(@event_step)
    assert_response :success
  end

  test "should update event_step" do
    patch event_step_url(@event_step), params: { event_step: { BreakTime: @event_step.BreakTime, EndTime: @event_step.EndTime, Num: @event_step.Num, StartDay: @event_step.StartDay, StartTime: @event_step.StartTime, plan_model_id: @event_step.plan_model_id } }
    assert_redirected_to event_step_url(@event_step)
  end

  test "should destroy event_step" do
    assert_difference("EventStep.count", -1) do
      delete event_step_url(@event_step)
    end

    assert_redirected_to event_steps_url
  end
end
