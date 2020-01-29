# frozen_string_literal: true

module LingutestClient
  module API
    module Operations
      module Update
        module ClassMethods
          def update(id, **params)
            new(
              Client.put(
                member_resource_url(id), self::OBJECT_NAME => params
              ).body[self::OBJECT_NAME]
            )
          end

          private

          def member_resource_url(id)
            "#{resource_url}/#{id}"
          end
        end

        module InstanceMethods
          def update(**params)
            self.class.update(id, params)
          end
        end

        def self.included(base)
          base.extend ClassMethods
          base.send(:include, InstanceMethods)
        end
      end
    end
  end
end
