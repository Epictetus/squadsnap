module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: false
    field :password, String, null: false

    def books_count
      books.size
    end
  end
end
