class User < ActiveRecord::Base

    has_secure_password

    has_many :ratings

    validates :email, uniqueness: { case_sensitive: false }
    validates :email, presence: true
    validates :password, length: { minimum: 8 }


    def authenticate_with_credentials(email, password)
        email = email.strip.downcase
        @user = User.find_by_email(email)

        if user && user.authenticate(password)
            return @user
        else
            return nil
        end
    end
end
