class Post < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :category

  # Define scope for search, this orders posts in descending order by the creation date, newest parts will be at the top
  default_scope -> { includes(:user).order(created_at: :desc) }

  # The joins method is used to query records from the associated tables. Also the basic SQL syntax is used to find records, based on provided strings.
  scope :by_category, -> (branch, category_name) do
    joins(:category).where(categories: {name: category_name, branch: branch})
  end

  scope :by_branch, -> (branch) do
    joins(:category).where(categories: {branch: branch})
  end

  scope :search, -> (search) do
    where("title ILIKE lower(?) OR content ILIKE lower(?)", "%#{search}%", "%#{search}%")
  end
end
