# frozen_string_literal: true

module LingutestClient
  module Api
    module Operations
      module Update
        module ClassMethods
          def update(id, **params)
            schema = const_get(:UpdateSchema).call(params)
            unless schema.success?
              raise ValidationError,
                    schema.errors.to_h.to_a.first.flatten.join(' ')
            end

            new(
              Client.put(
                member_resource_url(id), self::OBJECT_NAME => schema.to_h
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
