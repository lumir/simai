class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  attr_accessible :email, :password, :password_confirmation, :remember_me
  belongs_to :role

  def validate_confirmation(confirmation)
    if confirmation == self.password
      return true
    else
      return false
    end
  end
end
