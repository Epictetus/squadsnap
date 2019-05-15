class User < ApplicationRecord
  # Include resetable so in the development environment admin can reset database
  include Resetable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Associations
  has_many :members
  has_many :squads, through: :members
end
