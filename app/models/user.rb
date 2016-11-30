class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,
  # :trackable, :validatable, :recoverable
  devise :database_authenticatable, :registerable, :rememberable, :recoverable,
          :validatable
end
