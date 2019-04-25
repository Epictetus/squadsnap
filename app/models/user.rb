class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Associations, when a user gets deleted, all posts what the user has created will be deleted too.
  has_many :posts, dependent: :destroy
end
