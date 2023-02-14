# frozen_string_literal: true

module LingutestClient
  module API
    module Operations
      autoload :Create, 'lingutest_client/api/operations/create'
      autoload :Delete, 'lingutest_client/api/operations/delete'
      autoload :Find, 'lingutest_client/api/operations/find'
      autoload :List, 'lingutest_client/api/operations/list'
      autoload :Where, 'lingutest_client/api/operations/where'
      autoload :Update, 'lingutest_client/api/operations/update'
    end
  end
end
