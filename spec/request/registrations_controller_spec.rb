RSpec.describe RegistrationsController, type: :controller do

  describe 'create' do
    it 'create user account with valid parameter' do
      post :create, params: { user: { name: 'Any Name', email: 'any@email.com', password: 'password',password_confirmation: 'password' } }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      expect(flash[:notice]).to match('Successfully created account! Automatically logged in!')
    end
  end

  describe 'does not create' do
    it 'does not create account without name' do
      post :create, params: { user: { email: 'any@email.com', password: 'password',password_confirmation: 'password' } }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      expect(flash[:notice]).to match("Create account failed! Name can't be blank.")
    end
  end
end