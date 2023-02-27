# frozen_string_literal: true

RSpec.describe LingutestClient::Candidate, '.delete' do
  subject(:delete) { described_class.delete(candidate_id) }

  let(:candidate_id) { 30 }

  around do |example|
    VCR.use_cassette('candidate/delete') do
      example.run
    end
  end

  it { expect(delete).to be_nil }
end
