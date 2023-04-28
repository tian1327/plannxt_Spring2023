class EventStepsController < ApplicationController
  before_action :set_event_step, only: %i[ show edit update destroy ]


  # GET /event_steps/new
  def new
    @event_step = EventStep.new
  end

  # POST /event_steps or /event_steps.json
  def create
    @event_step = EventStep.new(event_step_params)

    respond_to do |format|
      if @event_step.save
        format.html { redirect_to event_step_url(@event_step), notice: "Event step was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_step
      @event_step = EventStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_step_params
      params.require(:event_step).permit(:Num, :StartDay, :StartTime, :EndTime, :Break1start, :Break1end,:Break2start,:Break2end, :plan_model_id)
    end
end
