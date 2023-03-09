# frozen_string_literal: true

module LingutestClient
  class ExaminationList < Base
    include Enumerable
    delegate ::LingutestClient::Api::Operations::List::DELEGATED_METHODS => :examinations

    attribute :examinations, Types::Array.of(Examination)

    attribute :limit_value,  Types::Coercible::Integer
    attribute :current_page, Types::Coercible::Integer
    attribute :total_pages,  Types::Coercible::Integer
    attribute :total_count,  Types::Coercible::Integer
    attribute :per_page,     Types::Coercible::Integer
    attribute :page,         Types::Coercible::Integer
  end
end
