class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true

    attr_reader :password

    after_initialize :ensure_session_token

    # PASSWORD REQUIREMENTS METHOD 1 #
    # PASSWORD_FORMAT = /\A
    # (?=.{8,})          # Must contain 8 or more characters
    # (?=.*\d)           # Must contain a digit
    # (?=.*[a-z])        # Must contain a lower case character
    # (?=.*[A-Z])        # Must contain an upper case character
    # (?=.*[[:^alnum:]]) # Must contain a symbol
    # /x

    # validates :password, 
    # presence: true, 
    # length: { in: Devise.password_length }, 
    # format: { with: PASSWORD_FORMAT }, 
    # confirmation: true, 
    # on: :create 

    # validates :password, 
    # allow_nil: true, 
    # length: { in: Devise.password_length }, 
    # format: { with: PASSWORD_FORMAT }, 
    # confirmation: true, 
    # on: :update

    # PASSWORD REQUIREMENTS METHOD 2 #
    # def password_requirements_are_met
    #     rules = {
    #         " must contain at least one lowercase letter"  => /[a-z]+/,
    #         " must contain at least one uppercase letter"  => /[A-Z]+/,
    #         " must contain at least one digit"             => /\d+/,
    #         " must contain at least one special character" => /[^A-Za-z0-9]+/
    #     }

    #     rules.each do |message, regex|
    #         errors.add( :password, message ) unless password.match( regex )
    #     end
    # end

    # SPIRE

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
