# frozen_string_literal: true

module LingutestClient
  module Api
    module Operations
      module Delete
        module ClassMethods
          def delete(id)
            Client.delete(member_resource_url(id)).body && nil
          end

          private

          def member_resource_url(id)
            "#{resource_url}/#{id}"
          end
        end

        module InstanceMethods
          def delete
            self.class.delete(id)
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
