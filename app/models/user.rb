class User < ApplicationRecord
    # adds virtual attributes for authentication
    has_secure_password
    # validates user_name
    validates :name, presence: true, uniqueness: true
    # validates email
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

    def self.from_omniauth(access_token)
        id = access_token.uid
        data = access_token.info
        email = data['email']
        name = data['name']
    
        User.find_or_create_by(email:, name:, id:)
    end
end
