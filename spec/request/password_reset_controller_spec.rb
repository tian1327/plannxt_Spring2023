require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do

  describe 'log in' do
    it 'log in valid user' do
      user = User.create( name: 'Any Name', email: 'any@email.com', 
                          password: 'password',password_confirmation: 'password' )
      get :create, params: { email_username: user.email, password: user.password }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      expect(flash[:notice]).to match('Account not exist! Please check your email address')
    end
  end

  describe 'update' do
    it 'update user password' do
      user = User.create( name: 'Any Name', email: 'any@email.com', 
                          password: 'password',password_confirmation: 'password' )
      user.update(id: user.id)
    end
  end

end