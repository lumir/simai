class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username         
  validates_presence_of :email
  validates_presence_of :password
  attr_accessible :email, :password, :password_confirmation, :remember_me
  belongs_to :role
end
