class User < ActiveRecord::Base
  has_many :games

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, length:{ minimum: 5 }

  validates :password, presence: true
  validates :password, length: { minimum: 4 }

  def self.verify_log_in?(email, password)
    @user = User.find_by(email: email)

    (User.find(@user.id).email == email) && (User.find(@user.id).password == password)
  end

end
