# frozen_string_literal: true

RSpec.describe LingutestClient::Examination, '.list' do
  subject(:list) { described_class.list }

  around do |example|
    VCR.use_cassette('examination/list', record: :new_episodes) do
      example.run
    end
  end

  it { expect(list).to be_a(LingutestClient::ExaminationList) }
  it { expect(list.examinations).not_to be_empty }
  it { expect(list.examinations).to all(be_a(described_class)) }

  describe 'delegate methods' do
    it { is_expected.to delegate_method(:each).to(:examinations) }
    it { is_expected.to delegate_method(:empty?).to(:examinations) }
    it { is_expected.to delegate_method(:find).to(:examinations) }
    it { is_expected.to delegate_method(:first).to(:examinations) }
    it { is_expected.to delegate_method(:last).to(:examinations) }
    it { is_expected.to delegate_method(:map).to(:examinations) }
    it { is_expected.to delegate_method(:reject).to(:examinations) }
    it { is_expected.to delegate_method(:select).to(:examinations) }
    it { is_expected.to delegate_method(:size).to(:examinations) }
  end

  describe 'filters' do
    context 'with valid filter options' do
      subject(:list) { described_class.list(team_id_eq: 2, team_group_id_eq: 2, student_id_eq: 1) }

      it { expect(list).not_to be_empty }
    end

    context 'with invalid filter options' do
      subject(:list) { described_class.list(candidate_id: 2) }

      it { expect { list }.to raise_error(ArgumentError) }
    end
  end
end
