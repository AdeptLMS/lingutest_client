# frozen_string_literal: true

require 'ostruct'

module LingutestClient
  module Api
    module Resource
      module ClassMethods
        def resource_url
          "/api/v1/#{self::OBJECT_NAME.to_s.downcase.tr('.', '/')}s"
        end
      end

      def self.included(base)
        base.extend ClassMethods
      end
    end
  end
end
