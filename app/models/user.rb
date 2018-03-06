class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.strip.downcase)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 5}
  validates :password_confirmation, presence: true, length: {minimum: 5}
end
