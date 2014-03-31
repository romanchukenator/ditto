class User < ActiveRecord::Base
  include BCrypt

  has_many :games

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, length:{ minimum: 5 }

  validates :password, presence: true
  validates :password, length: { minimum: 4 }

  def self.verify_log_in?(email, password)
    if @user = User.find_by(email: email)
      (User.find(@user.id).email == email) && (User.find(@user.id).password == password)
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end  


end
