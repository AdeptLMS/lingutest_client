# frozen_string_literal: true

module LingutestClient
  module API
    module Operations
      module Create
        module ClassMethods
          def create(**params) # rubocop:disable Metrics/AbcSize
            schema = const_get(:CreateSchema).call(params)
            unless schema.success?
              raise ValidationError,
                    schema.errors.to_h.to_a.first.flatten.join(' ')
            end

            response = Client.post(
              resource_url, self::OBJECT_NAME => schema.to_h
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
