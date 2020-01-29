# frozen_string_literal: true

module LingutestClient
  module API
    module Operations
      module Create
        module ClassMethods
          def create(**params)
            response = Client.post(
              resource_url, self::OBJECT_NAME => params
            )
            new(response.body[self::OBJECT_NAME])
          end
        end

        def self.included(base)
          base.extend ClassMethods
        end
      end
    end
  end
end
