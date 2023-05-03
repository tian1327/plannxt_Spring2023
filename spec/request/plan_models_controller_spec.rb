require 'rails_helper'

RSpec.describe PlanModelsController, type: :controller do

  describe "creates" do
    it "plan model with valid parameters" do
      post :create, params: { name: 'demo', scale: 'feet',length: '20', width:'20' ,event_steps_attributes: { Num: 1, StartDay: "2023-03-01", StartTime: '10:20', EndTime: '10:20', Break1start: '10:20', 
                              Break1end:'10:20',Break2start:'10:20',Break2end: '10:20', plan_model_id:5 }}
      
      expect(response.content_type).to eq 'text/html; charset=utf-8'
                                             
    end
  end

  describe 'destroy' do
    it 'destroy eventstep with valid parameters' do
      model1 = PlanModel.create( name: 'demo')
      #get :destroy, params: { id: event1.id}
      #expect(flash[:notice]).to match(/'Outfoxed!' deleted./)
      get :destroy, params: { id: model1.id}
    end
  end


  describe 'update' do
    it 'update planmodel with valid parameters' do
      model1 = PlanModel.create( name: 'demo')
      #get :destroy, params: { id: event1.id}
      #expect(flash[:notice]).to match(/'Outfoxed!' deleted./)
      #model1.update( name: 'demo1')
      get :update, params: { id: model1.id}
    end
  end


  
end
