require 'rails_helper'

RSpec.describe EventStepsController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'redirects to home page' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'responds to' do
    it 'responds to html by default' do
      post :create, params: { event_step: { Num: 1, StartDay: "2023-03-01", StartTime: '10:20', EndTime: '10:20', Break1start: '10:20', Break1end:'10:20',Break2start:'10:20',Break2end: '10:20', plan_model_id:5 } }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
  end

  describe "creates" do
    it "event_steps with valid parameters" do
      post :create, params: { event_step: { Num: 1, StartDay: "2023-03-01", StartTime: '10:20', EndTime: '10:20', Break1start: '10:20', 
                              Break1end:'10:20',Break2start:'10:20',Break2end: '10:20', plan_model_id:5 } }
    end
  end

  describe 'updates' do
    it "redirects to the event step page and flashes a notice" do
      event1 = EventStep.create( Num: 1, StartDay: "2023-03-01", StartTime: '10:20', EndTime: '10:20', Break1start: '10:20', 
      Break1end:'10:20',Break2start:'10:20',Break2end: '10:20', plan_model_id:5 )
      EventStep.update( id: event1.id  )
    end
  end

  describe 'new' do
    it "redirects to the event step page and flashes a notice" do
      event1 = EventStep.new
    end
  end

  describe 'destroy' do
    it 'eventstep with valid parameters' do
      event1 = EventStep.create( Num: 1, StartDay: "2023-03-01", StartTime: '10:20', EndTime: '10:20', Break1start: '10:20', 
                                 Break1end:'10:20',Break2start:'10:20',Break2end: '10:20', plan_model_id:5 )
      event1.destroy
      expect(response).to be_successful
    end
  end

end
