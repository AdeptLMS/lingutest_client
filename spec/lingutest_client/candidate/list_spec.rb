# frozen_string_literal: true

RSpec.describe LingutestClient::Candidate, '.list' do
  subject(:list) { described_class.list }

  around do |example|
    VCR.use_cassette('candidate/list', record: :new_episodes) do
      example.run
    end
  end

  it { expect(list).to be_a(LingutestClient::CandidateList) }
  it { expect(list.candidates).not_to be_empty }
  it { expect(list.candidates).to all(be_a(described_class)) }

  describe 'delegate methods' do
    it { is_expected.to delegate_method(:each).to(:candidates) }
    it { is_expected.to delegate_method(:empty?).to(:candidates) }
    it { is_expected.to delegate_method(:find).to(:candidates) }
    it { is_expected.to delegate_method(:first).to(:candidates) }
    it { is_expected.to delegate_method(:last).to(:candidates) }
    it { is_expected.to delegate_method(:map).to(:candidates) }
    it { is_expected.to delegate_method(:reject).to(:candidates) }
    it { is_expected.to delegate_method(:select).to(:candidates) }
    it { is_expected.to delegate_method(:size).to(:candidates) }
  end
end
