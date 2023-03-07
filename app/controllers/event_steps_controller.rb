class EventStepsController < ApplicationController
  before_action :set_event_step, only: %i[ show edit update destroy ]

  # GET /event_steps or /event_steps.json
  def index
    @event_steps = EventStep.all
  end

  # GET /event_steps/1 or /event_steps/1.json
  def show
  end

  # GET /event_steps/new
  def new
    @event_step = EventStep.new
  end

  # GET /event_steps/1/edit
  def edit
  end

  # POST /event_steps or /event_steps.json
  def create
    @event_step = EventStep.new(event_step_params)

    respond_to do |format|
      if @event_step.save
        format.html { redirect_to event_step_url(@event_step), notice: "Event step was successfully created." }
        format.json { render :show, status: :created, location: @event_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_steps/1 or /event_steps/1.json
  def update
    respond_to do |format|
      if @event_step.update(event_step_params)
        format.html { redirect_to event_step_url(@event_step), notice: "Event step was successfully updated." }
        format.json { render :show, status: :ok, location: @event_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_steps/1 or /event_steps/1.json
  def destroy
    @event_step.destroy

    respond_to do |format|
      format.html { redirect_to event_steps_url, notice: "Event step was successfully destroyed." }
      format.json { head :no_content }
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
