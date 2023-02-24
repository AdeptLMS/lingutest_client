# frozen_string_literal: true

module LingutestClient
  module Connection
    module ClassMethods
      def client
        Thread.current[:lingutest_client] ||= connection
      end

      def connection # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
        Thread.current[:lingutest_default_connection] ||=
          Faraday.new(url: LingutestClient.config.api_base) do |c|
            c.request :json
            c.response :raise_error
            c.response :json,
                       content_type: /\bjson$/,
                       parser_options: { symbolize_names: true }
            c.headers['X-Api-Token'] =
              format('Token token="%<key>s"',
                     key: LingutestClient.config.api_key)
            c.headers[:user_agent] = 'Lingutest Ruby Client'
            c.headers['Content-Type'] = 'application/json'
            c.headers['Accept'] = 'application/json'
            c.adapter Faraday.default_adapter
          end
      end
    end

    def self.included(base)
      base.extend ClassMethods
      base.extend Forwardable
      base.class_eval do
        def_delegators :connection, :get, :post, :delete, :put, :patch
      end
      base.singleton_class.extend Forwardable
      base.singleton_class.class_eval do
        def_delegators :client, :get, :post, :delete, :put, :patch
      end
    end
  end
end
