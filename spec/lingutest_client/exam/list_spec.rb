# frozen_string_literal: true

RSpec.describe LingutestClient::Exam, '.list' do
  subject(:list) { described_class.list }

  around do |example|
    VCR.use_cassette('exam/list') do
      example.run
    end
  end

  it { expect(list).to be_a(LingutestClient::ExamList) }
  it { expect(list.exams).not_to be_empty }
  it { expect(list.exams).to all(be_a(described_class)) }

  describe 'delegate methods' do
    it { is_expected.to delegate_method(:each).to(:exams) }
    it { is_expected.to delegate_method(:empty?).to(:exams) }
    it { is_expected.to delegate_method(:find).to(:exams) }
    it { is_expected.to delegate_method(:first).to(:exams) }
    it { is_expected.to delegate_method(:last).to(:exams) }
    it { is_expected.to delegate_method(:map).to(:exams) }
    it { is_expected.to delegate_method(:reject).to(:exams) }
    it { is_expected.to delegate_method(:select).to(:exams) }
    it { is_expected.to delegate_method(:size).to(:exams) }
  end
end
