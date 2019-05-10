class Squad < ApplicationRecord
  has_many :members, :dependent => :delete_all
  has_many :users, through: :members
end
