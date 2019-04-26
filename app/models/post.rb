class Post < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :category

  # Define scope for search, this orders posts in descending order by the creation date, newest parts will be at the top
  default_scope -> { includes(:user).order(created_at: :desc) }
end
