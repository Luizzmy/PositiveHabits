class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many:activities
  has_many:daily_logs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
