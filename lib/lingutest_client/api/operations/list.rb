# frozen_string_literal: true

module LingutestClient
  module API
    module Operations
      module List
        DELEGATED_METHODS = %i[
          each
          empty?
          find
          first
          last
          map
          reject
          select
          size
        ].freeze

        class << self
          def module(list_type, params_schema = nil)
            Module.new do
              class_methods_module = Module.new

              class_methods_module.define_method :list do |**options|
                params = options.dup
                if params_schema
                  result = params_schema.call(options)
                  raise ArgumentError, result.errors if result.failure?

                  params = result.to_h
                end
                list_type.new(Client.get(resource_url, **params).body)
              end

              define_singleton_method :included do |base|
                base.extend class_methods_module
              end
            end
          end
        end
      end
    end
  end
end
