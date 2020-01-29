# frozen_string_literal: true

module LingutestClient
  module API
    module Operations
      module Find
        module ClassMethods
          def find(id)
            new(Client.get("#{resource_url}/#{id}").body[self::OBJECT_NAME])
          end
        end

        module InstanceMethods
          def reload
            self.class.find(id)
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
