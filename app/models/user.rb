class User < ActiveRecord::Base
  has_many :games

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, length:{ minimum: 5 }

  validates :password, presence: true
  validates :password, length: { minimum: 4 }

end
