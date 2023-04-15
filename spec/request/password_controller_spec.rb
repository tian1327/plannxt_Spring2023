require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do

  describe 'update' do
    it 'update user password' do
      user = User.create( name: 'Any Name', email: 'any@email.com', 
                          password: 'password',password_confirmation: 'password' )
      #user.update(id: user.id)
      get :update, params: { password: 'new', password_confirmation: 'new' }
    end
  end

end