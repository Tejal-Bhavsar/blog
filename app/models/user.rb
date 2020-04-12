class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:confirmable, :lockable, :timeoutable,:recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  has_many :articles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
       
end
