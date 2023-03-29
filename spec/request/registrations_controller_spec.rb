require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  describe 'responds to' do
    it 'responds to html by default' do
      post :create, params: { user: { name: 'Any Name', email: 'any@email.com', password: 'password',password_confirmation: 'password' } }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
  end
end
