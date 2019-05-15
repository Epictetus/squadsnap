module Resetable
  extend ActiveSupport::Concern
  class_methods do
    def truncate!
      self.connection.execute(
        "TRUNCATE TABLE #{ self.table_name };"
      )
      self.connection.reset_pk_sequence!(self.table_name)
    end
  end
end
