require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'fail log in' do
    it 'do not allow log in with invalid parameter' do
      user = User.create( name: 'Any Name', email: 'any@email.com', 
                          password: 'password',password_confirmation: 'password' )
      get :create, params: { name: 'Any Name', email: 'any@email.com', 
                             password: 'password'}
      expect(flash[:notice]).to match('Invalid username/email or password')
    end
  end

  describe 'log in' do
    it 'log in valid user' do
      user = User.create( name: 'Any Name', email: 'any@email.com', 
                          password: 'password',password_confirmation: 'password' )
      get :create, params: { email_username: user.email, password: user.password }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      expect(flash[:notice]).to match('Logged in successfully')
      model1 = PlanModel.create( name: 'demo')
    end
  end

  describe 'log out the user' do
    it 'logs out valid user' do
      user = User.create( name: 'Any Name', email: 'any@email.com', 
                        password: 'password',password_confirmation: 'password' )
      #user.destroy
      get :destroy, params: { id: user.id}
      expect(flash[:notice]).to match('Logged Out')
    end
  end

end