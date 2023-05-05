class PlanModelsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :require_user_logged_in!
  
  def index
    logger.info Current.user.id
    @plan_model = PlanModel.where(":user = ANY(viewers) OR :user = creator", user: Current.user.id).order("created_at DESC")
    @user = User.all
    #render json: @plan_model.to_json
  end
  
  def show
    @plan_model = PlanModel.find(params[:id])
    #render json: @plan_model.to_json
  end

  
  def show_json
    @plan_model = PlanModel.find(params[:id])
    render json: {error_code:0,  data:@plan_model}
  end

  
  def new
    @plan_model = PlanModel.new
    @plan_model.event_steps.build
  end
  
  def fix_params

    if params[:plan_model].blank?
        # parent not provided
        return
    end
    new_paras = plan_model_data
    #create default data structure
    extra1_dict = {
      "day1_date" => "2023-03-01","day1_hour1" => '5',"day1_hour2" => '10',"day1_hour3" => '6',
      "day1_hour4" => '7',"day1_hour5" => '8',"day1_hour6" => '9',
      "day2_date" => "","day2_hour1" => '',"day2_hour2" => '',"day2_hour3" => '',
      "day2_hour4" => '', "day2_hour5" => '',"day2_hour6" => '',
      "day3_date" => "","day3_hour1" => '',"day3_hour2" => '',"day3_hour3" => '',
      "day3_hour4" => '',"day3_hour5" => '',"day3_hour6" => '',
      "day4_date" => "","day4_hour1" => '',"day4_hour2" => '',
      "day4_hour3" => '',"day4_hour4" => '',"day4_hour5" => '',"day4_hour6" => '',
      "scale" => 'Feet',
      "length" => '50',
      "width" => '50'}
    #parse actual data from user data and format properly
    puts params[:plan_model][:scale]
    puts params[:plan_model][:length]
    puts params[:plan_model][:width]
    extra1_dict["scale"]= params[:plan_model][:scale]
    extra1_dict["length"]= params[:plan_model][:length]
    extra1_dict["width"]= params[:plan_model][:width]
    eventsteptotal = params[:plan_model][:event_steps_attributes]
    i=1
    #iterate through all the event days
    eventsteptotal.each do |key,unit_event|
      extra1_dict["day"+ i.to_s+"_date"] = unit_event[:StartDay]
      extra1_dict["day"+ i.to_s+"_hour1"] = unit_event[:StartTime]
      extra1_dict["day"+ 1.to_s+"_hour2"] = unit_event[:EndTime]
      extra1_dict["day"+ 1.to_s+"_hour3"] = unit_event[:Break1start]
      extra1_dict["day"+ 1.to_s+"_hour4"] = unit_event[:Break1end]
      extra1_dict["day"+ 1.to_s+"_hour5"] = unit_event[:Break2start]
      extra1_dict["day"+ 1.to_s+"_hour6"] = unit_event[:Break2end]
      i+=1
    end
    if params[:plan_model].key?("day1_date")
      extra1_dict = {"day1_date" => params[:plan_model].delete(:day1_date),
                                      "day1_hour1" => params[:plan_model].delete(:day1_hour1),
                                      "day1_hour2" => params[:plan_model].delete(:day1_hour2),
                                      "day1_hour3" => params[:plan_model].delete(:day1_hour3),
                                      "day1_hour4" => params[:plan_model].delete(:day1_hour4),
                                      "day1_hour5" => params[:plan_model].delete(:day1_hour5),
                                      "day1_hour6" => params[:plan_model].delete(:day1_hour6),
                                      "day2_date" => params[:plan_model].delete(:day2_date),
                                      "day2_hour1" => params[:plan_model].delete(:day2_hour1),
                                      "day2_hour2" => params[:plan_model].delete(:day2_hour2),
                                      "day2_hour3" => params[:plan_model].delete(:day2_hour3),
                                      "day2_hour4" => params[:plan_model].delete(:day2_hour4),
                                      "day2_hour5" => params[:plan_model].delete(:day2_hour5),
                                      "day2_hour6" => params[:plan_model].delete(:day2_hour6),
                                      "day3_date" => params[:plan_model].delete(:day3_date),
                                      "day3_hour1" => params[:plan_model].delete(:day3_hour1),
                                      "day3_hour2" => params[:plan_model].delete(:day3_hour2),
                                      "day3_hour3" => params[:plan_model].delete(:day3_hour3),
                                      "day3_hour4" => params[:plan_model].delete(:day3_hour4),
                                      "day3_hour5" => params[:plan_model].delete(:day3_hour5),
                                      "day3_hour6" => params[:plan_model].delete(:day3_hour6),
                                      "day4_date" => params[:plan_model].delete(:day4_date),
                                      "day4_hour1" => params[:plan_model].delete(:day4_hour1),
                                      "day4_hour2" => params[:plan_model].delete(:day4_hour2),
                                      "day4_hour3" => params[:plan_model].delete(:day4_hour3),
                                      "day4_hour4" => params[:plan_model].delete(:day4_hour4),
                                      "day4_hour5" => params[:plan_model].delete(:day4_hour5),
                                      "day4_hour6" => params[:plan_model].delete(:day4_hour6),
                                      "scale" => params[:plan_model].delete(:scale),
                                      "length" => params[:plan_model].delete(:length),
                                      "width" => params[:plan_model].delete(:width)
                                      
      }
    end
    new_paras[:extra1] = extra1_dict.to_json
    logger.info "After fix:"
    logger.info new_paras
    puts new_paras
    return new_paras
  end

  def create
    #@plan_model = PlanModel.new(plan_model_data)
    @plan_model = PlanModel.new(fix_params)
    @plan_model.creator = Current.user.id

    if @plan_model.save
      flash[:notice] = "#{@plan_model.name} created successfully."
      redirect_to edit_page_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def create_json
    @plan_model = PlanModel.new(plan_model_data)
    logger.info @plan_model.data
    if @plan_model.save
      render json: {error_code:0, id:@plan_model.id, data:@plan_model}
    else
      render json: {error_code:1,  data:@plan_model}
    end
  end
  
  '''
  def edit_admin
    @plan_model = PlanModel.find(params[:id])
  end
  '''
  
  def edit
    @plan_model = PlanModel.find(params[:id])
    render :drawPanel
  end
  
  def dependency
    @plan_model = PlanModel.find(params[:id])
    render :dependency
  end

  def draw_panel
    @plan_model = PlanModel.find(params[:id])
    @extra1_dict = JSON.parse(@plan_model.extra1)
    #render file: 'frontend/drawPanel.html', layout: false
  end
  
  def update
    paras = fix_params
    @plan_model = PlanModel.find(params[:id])
    #logger.info "start patch"
    
    if @plan_model.update(paras)
      #flash[:notice] = "#{@plan_model.name} was successfully updated."
      #redirect_to @plan_model
      redirect_to edit_plan_model_path(@plan_model)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_json
    @plan_model = PlanModel.find(params[:id])
    # logger.info params[:plan_model]
    #@plan_model.attributes = params[:plan_model]
    if @plan_model.update(plan_model_data)
      render json: {error_code:0,  data:@plan_model}
    else
      render json: {error_code:1,  data:@plan_model}
    end
  end

  
  def destroy
    @plan_model = PlanModel.find(params[:id])
    if creator?
      @plan_model.destroy
      flash[:notice] = "'#{@plan_model.name}' deleted successfully."
    elsif access?
      @plan_model.viewers.delete Current.user.id
      @plan_model.editors.delete Current.user.id
      @plan_model.save
      flash[:notice] = "Removed from '#{@plan_model.name}'."
    else
      flash[:notice] = "Not found."
    end
    redirect_to edit_page_path 
  end
  '''
  def destroy_json
    @plan_model = PlanModel.find(params[:id])
    if @plan_model.destroy
      render json: {error_code:0}
    else
      render json: {error_code:1}
    end
  end
  '''

  def duplicate
    @plan_model = PlanModel.find(params[:id]).dup
    if access?
      flush_users
      @plan_model.save
      flash[:notice] = "Plan '#{@plan_model.name}' copied successfully."
    else
      flash[:notice] = "Not found."
    end
    redirect_to edit_page_path
  end

  def export
    @plan_model = PlanModel.find(params[:id])
    if access?
      send_data @plan_model.to_json, :filename => "#{@plan_model.name}.plannxt"
    else
      flash[:notice] = "Not found."
      redirect_to edit_page_path
    end
  end

  def import
    @plan_model = PlanModel.new(JSON.parse(params[:upload].read)).dup
    flush_users
    @plan_model.event_steps.build
    @plan_model.save
    flash[:notice] = "Plan '#{@plan_model.name}' imported successfully."
    redirect_to edit_page_path
  end

  def sharing
    @plan_model = PlanModel.find(params[:id])
    render :sharing
  end
  
  def share
    @plan_model = PlanModel.find(params[:id])
    user = User.find_by(name: params[:user])
    if !user.nil?
      @plan_model.viewers |= [user.id]
      if params[:edit]
        @plan_model.editors |= [user.id]
      end
      @plan_model.save
      flash[:notice] = "'#{@plan_model.name}' shared with #{user.name}."
    else
      flash[:notice] = "User not found."
    end
    redirect_to edit_page_path
  end
  
  private
    def plan_model_data
      if Current.user
        params.require(:plan_model).permit(:name, :data, :editPermission, :viewPermission, :extra1, :extra2, :extra3, event_steps_attributes:[:id, :Num,:StartDay, :StartTime, :EndTime, :Break1start, :Break1end,:Break2start,:Break2end, :_destroy])
      else
        params.require(:plan_model).permit(:name, :data, :editPermission, :viewPermission, :extra1, :extra2, :extra3, event_steps_attributes:[:id, :Num, :StartDay, :StartTime, :EndTime, :Break1end,:Break2start,:Break2end,:_destroy])
      end
    end
    
    def creator?
      Current.user.id == @plan_model.creator
    end

    def access?
      Current.user.id.in? @plan_model.viewers << @plan_model.creator
    end

    def flush_users
      @plan_model.creator = Current.user.id
      @plan_model.viewers.clear
      @plan_model.editors.clear
    end
end