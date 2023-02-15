# frozen_string_literal: true

module LingutestClient
  class ExaminationList < Base
    include Enumerable
    delegate ::LingutestClient::API::Operations::List::DELEGATED_METHODS => :examinations

    attribute :examinations, Types::Array.of(Examination)
    attribute :page, Types::Integer
    attribute :per_page, Types::Integer
    attribute :current_page, Types::Integer
    attribute :limit_value, Types::Integer
    attribute :total_pages, Types::Integer
    attribute :total_count, Types::Integer
  end
end
