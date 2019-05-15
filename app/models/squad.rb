class Squad < ApplicationRecord
  # Include resetable so in the development environment admin can reset database
  include Resetable
  
  has_many :members, :dependent => :delete_all
  has_many :users, through: :members
end
