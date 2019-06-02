class Member < ApplicationRecord
  # Include resetable so in the development environment admin can reset database
  include Resetable

  belongs_to :user
  belongs_to :squad
end
